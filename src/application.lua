-- server listens on 80, if data received, print data to console and send "hello world" back to caller
-- 30s time out for a inactive client

-- i2c
doorOpen = false
debugMsg = "PORTAI"
dofile("draw.lua")

led = 4
gpio.mode(led,gpio.OUTPUT) -- Assign GPIO to Output
_GET = {}

function requestHandler(conn) 
    conn:on("receive",function(client, request) 
        
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        debugMsg = method .. path
        
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        buf = buf.."<h1> ESP8266 Web Server</h1>";
        buf = buf.."<p>GPIO0 <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";
    
        if _GET.open == "true" then
            gpio.write(led, gpio.LOW)
            doorOpen = true         
            print_OLED()           
        elseif _GET.open == "false" then
            gpio.write(led, gpio.HIGH)
            doorOpen = false
            print_OLED()
        end
        print(request)
        
        
        if (_GET.steps and _GET.steps > 0) then
            moveMotor(_GET.steps, _GET.dir, _GET.delay)
        end
        
        client:send(buf)
        client:close();
        collectgarbage();
    end)
end

function moveMotor(steps, dir, delay)
    print(steps)
    print(dir)
    print(delay)

    step_move(_GET.steps, _GET.dir, _GET.delay)
end

srv=net.createServer(net.TCP, 30)
srv:listen(80, requestHandler)


