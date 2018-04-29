-- load credentials, 'SSID' and 'PASSWORD' declared and initialize in there
dofile("credentials.lua")


function execute()
    print("Running")
    file.close("init.lua")
    
    dofile("stepper.lua")
    dofile("graphicsinit.lua")

    -- the actual application is stored in 'application.lua'
    dofile("application.lua")
    
    -- init successful, blink led twice 
    --dofile("blinkLED.lua")
end

function startup()
    -- dofile("blinkLED.lua")
    if file.open("init.lua") == nil then
        print("init.lua deleted or renamed")
    else
    print("Connecting to WiFi access point...")
    wifi.setmode(wifi.STATION)
    wifi.sta.config(SSID, PASSWORD)
    -- wifi.sta.connect() not necessary because config() uses auto-connect=true by default
    timerObj:alarm(1000, tmr.ALARM_AUTO, function(cb_timer)
        if wifi.sta.getip() == nil then
            print("Waiting for IP address...")
        else
            cb_timer:unregister()
            print("WiFi connection established, IP address: " .. wifi.sta.getip())
            execute()
        end
    end)
       
    end
end
timerObj = tmr.create()
print("You have 3 seconds to abort")
print("Waiting...")
timerObj:alarm(3000, tmr.ALARM_SINGLE, startup)
