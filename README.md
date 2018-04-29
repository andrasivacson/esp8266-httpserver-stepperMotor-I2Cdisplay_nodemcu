# Scope #

1. This guide describes how to flash a nodemcu firmware and develop againt the ESP8266 with Esplorer.
2. Additionally the repository contains the lua script for basic Stepper motor and I2c display control over an exposed http endpoint.
See the attached image of the end result:
![alt text](https://raw.githubusercontent.com/andrasivacson/esp8266-http-stepper-I2C_nodemcu/master/breadboard.jpg "breadboard")


## Flashing nodemcu firmware ##
Start off with nodemcu following the official guide: 
https://nodemcu.readthedocs.io/en/master/en/build/

Use cloud build service to create a firmware file.
Install python 2 latest
Follow the guide here on how to flash using esptool.py here:
https://nodemcu.readthedocs.io/en/master/en/flash/
Source: https://github.com/espressif/esptool

Download pip first following this lnk: https://pip.pypa.io/en/stable/installing/
python get-pip.py
pip install esptool
wemos D1 development board though USB.
Check in Windows Device Manager to confirm the serial connection working under the Ports section.
Should be COM1->4.

Flash the firmware by running this:
esptool.py --port <serial-port-of-ESP8266> write_flash -fm <mode> 0x00000 <nodemcu-firmware>.bin

For Wemod D1 mode should be:dio

## Development ##

1. For development you can use the esptool or the IDe of your choice. Follow the below guide to upload your code to the ESP.
https://nodemcu.readthedocs.io/en/master/en/upload/

2. You can test the upload process by uploading an example script suchg as the included blinkled.lua file and set it to init.

3. For connecting to wifi you need to edit the credential.lua file with your wifi's credentials
