#!/bin/bash
#

set -e

apt-get install -y hostapd dnsmasq
systemctl disable hostapd
systemctl disable dnsmasq

cp etc/dnsmasq.d/rpi-access-point.conf /etc/dnsmasq.d/rpi-access-point.conf
cp etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf
cp etc/systemd/system/rpi-access-point.service /etc/systemd/system/rpi-access-point.service
cp usr/bin/rpi-access-point /usr/bin/rpi-access-point

echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"" | tee /etc/default/hostapd > /dev/null

systemctl enable rpi-access-point.service
