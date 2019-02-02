# brematic_gwy_433
Basic command line tool to switch 433 MHz receivers through a Brematic GWY 433

There is a shellscript switch.sh that you have to call with 3 parameters:
system-code, unit-code, on/off

system- and unit-code are both 5-digit binary codes, that resemble the DIP switches in your receivers.
"System" ist the one with 1-5, "Unit" is the one usually with A-E.

The third parameter is the word "on" or "off"

Before you can use this script, you have to edit the script, and put in the IP-address of your gateway in line 10.

So `ip="xxx.xxx.xxx.xxx"` becomes something like `ip="192.168.178.34"` or whatever your gateway address is. I recommend to set the address of your gateway by DHCP to a fixed IP.

For the script to work, it is also necessary that `nc` is installed, the netcat-command. Usually you can achieve this by running `sudo yum install nc` on CentOS, RedHat etc. If you use a different OS or packet manager, you'll have to check how to do it.
