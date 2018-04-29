pin=4
gpio.mode(pin,gpio.OUTPUT) -- Assign GPIO to Output
gpio.write(pin,gpio.LOW) -- LED ON
timerObj:alarm(500, tmr.ALARM_SINGLE, function()
    gpio.write(pin,gpio.HIGH) -- LED OFF
    
    timerObj:alarm(500, tmr.ALARM_SINGLE, function()
        gpio.write(pin,gpio.LOW) -- LED ON
        
        timerObj:alarm(500, tmr.ALARM_SINGLE, function()
            gpio.write(pin,gpio.HIGH) -- LED OFF
        end)
    end)
end)
