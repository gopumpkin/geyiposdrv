# geyiposdrv
Geyi thermal POS printer driver 歌翼热敏小票打印机驱动

This is the CUPS printer driver for Geyi 58MM/80MM thermal POS printer driver with install script for Raspberry Pi.  CUPS is the standards-based, open source printing system developed by Apple and other Unix-like operating systems.  For more information, see https://www.cups.org/

The driver is provided by Geyi, I added instruction and the install script plus the Raspberry Pi logo for testing.  The instruction and script is tested on Raspbian Stretch Lite but may work for other Linux variant system using CUPS.

This is the CUPS printer driver for Geyi 58MM/80MM thermal POS printer driver with install script for Raspberry Pi.  CUPS is the standards-based, open source printing system developed by Apple and other Unix-like operating systems.  For more information, see https://www.cups.org/

The driver is provided by Geyi, I added instruction and the install script plus the Raspberry Pi logo for testing.  The instruction and script is tested on Raspbian Stretch Lite but may work for other Linux variant system using CUPS.

##  Instruction to install thermal printer via USB on Raspberry Pi
 
1.	Download Raspbian Stretch Lite at https://www.raspberrypi.org/downloads/raspbian/
2.	Flash the image to an SD card according to https://www.raspberrypi.org/documentation/installation/installing-images/README.md
3.	Plug in your keyboard & mouse & the printer to the USB port.  Depending on the model of your Raspberry Pi, you may need to plug in your network cable or WiFi adapter
4.	Start up your Raspberry Pi
5.	Login with default pi/raspberry user and password
6.	Run raspi-config
```
sudo raspi-config
```
7.	Required settings
  -	Under "Advanced Options", Expand Filesystem
8.	Optional settings
  -	Change User Password because everybody knows the default. 
  -	Under "Network Options": Change Hostname to distinguish this system from other Raspberry Pi systems on the network. 
  -	If using WiFi, select "Network Options" item and then "Wi-Fi" option
  -	Under “Localisation Options,” configure the keyboard and optionally the locale and time zone) to match your needs.
  -	Interfacing Options: Enable SSH to allow remote administration via network. 
  -	Advanced Options: Disable Overscan gives a little more working space if using an HDMI monitor
9.	After the changes, reboot the system and log in as 'pi' again
10.	By now you should be able to write directly to the USB printer without using the printer driver, but first you need you need to add access rights
```
sudo chmod a+w /dev/usb/lp0
sudo echo -e "Testing 1,2,3… SUCCESS!!!\n\n\n" > /dev/usb/lp0
```
11.	Before we install the printer support, need to update the system first
```
sudo apt-get update
sudo apt-get install git cups
```
12.	Download printer driver PPD files at git hub
```
git clone https://github.com/gopumpkin/geyiposdrv
```
13.	Install driver
```
chmod u+x install.sh
sudo ./install.sh
```
14.	Add pi user to the lpadmin group.  This will allow pi user to access CUPS admin functions
```
sudo usermod -a -G lpadmin pi
```
15.	For use in a home network, it would be easier to allow CUPS accessible across the whole network
```
sudo cupsctl --remote-any
sudo /etc/init.d/cups restart
```
16.	Find out the local IP address of the Raspberry Pi
```
hostname -I
```
17.	If you are using Raspbian Stretch Lite, you need to access CUPS administration on another system's browser.  If you are using Raspbian Stretch with desktop, you can access the administration page on the Raspberry Pi's browser.
http://192.168.1.100:631/admin (remember to swap your own IP here & printer is plug-in and turned on)
18.	Add printer by select "Administration" menu, select "Unknown" under Local Printers
19.	Give a name and a description to the printer
20.	From the Make, select "Printer", click "Continue"
21.	Next, pick your Model, POS58 or POS80
22.	From the "Printers" menu, under "Administration" pull-down menu, select "Set as Server Default"
23.	To test CUPS is setup correctly, try printing some text
```
echo "This is a test." | lp
```
24.	You can try printing a picture as well, there is a Raspberry Pi logo with the driver for testing
```
lp -o fit-to-page raspberrypi.png
``` 
 
## Acknowledgement
- Thanks to Geyi for the driver, you can find their website at http://www.gy-printer.com/
- The instructions were developed based on a number of excellent tutorials on Adafruit https://www.adafruit.com/

