#!/bin/bash
#

set -e

apt-get update
apt-get install --yes hostapd dnsmasq
systemctl disable hostapd
systemctl disable dnsmasq

if [ -f /etc/network/interfaces ]; then
  mv /etc/network/interfaces /etc/network/interfaces.old
fi
cp etc/network/interfaces /etc/network/interfaces

if [ -f /etc/default/hostapd ]; then
  mv /etc/default/hostapd /etc/default/hostapd.old
fi
cp etc/default/hostapd /etc/default/hostapd

if [ -f /etc/hostapd/hostapd.conf ]; then
  mv /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.old
fi
cp etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf

cp etc/dnsmasq.d/rpi-access-point.conf /etc/dnsmasq.d/rpi-access-point.conf

cp etc/systemd/system/rpi-access-point.service /etc/systemd/system/rpi-access-point.service
cp usr/bin/rpi-access-point /usr/bin/rpi-access-point

systemctl enable rpi-access-point.service
