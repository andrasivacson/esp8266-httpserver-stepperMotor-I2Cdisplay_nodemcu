-- OLED Display demo
-- March, 2016 
-- @kayakpete | pete@hoffswell.com
-- Hardware: 
--   ESP-12E Devkit
--   4 pin I2C OLED 128x64 Display Module
-- Connections:
--   ESP  --  OLED
--   3v3  --  VCC
--   GND  --  GND
--   D4   --  SDA
--   D3   --  SCL

-- Variables 
sda = 3 -- SDA Pin
scl = 4 -- SCL Pin
disp = 0
function init_OLED(sda,scl) --Set up the u8glib lib
     sla = 0x3C
     i2c.setup(0, sda, scl, i2c.SLOW)
     disp = u8g.ssd1306_128x64_i2c(sla)
     disp:setFont(u8g.font_6x10)
     disp:setFontRefHeightExtendedText()
     disp:setDefaultForegroundColor()
     disp:setFontPosTop()
     --disp:setRot180()           -- Rotate Display if needed
end
init_OLED(sda,scl)
