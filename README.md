# rpi3-hotspot

Turns a Raspberry Pi 3 into a configurable hotspot.

## How this works

A hotspot is created if `/boot/hotspot.txt` file is present. If there is no such file, no hotspot will be set up and the `/etc/wpa_supplicant/wpa_supplicant.conf` will be used.

Defaults are `ssid=PoppyHotspot` and `passphrase=poppyproject` but can be changed by tweaking the `/boot/hotspot.txt` file. One or both parameters can be modified.  
The Raspberry Pi IP address will be `192.168.0.1`.

```
# /boot/hotspot.txt
ssid=RodrigoTheRobot
passphrase=thesecretpassphrase
```


## Installation

1. Clone this repo or download the archive.
2. `sudo ./install.sh`
3. Profit.
