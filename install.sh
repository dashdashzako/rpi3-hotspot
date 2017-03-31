apt-get install -y hostapd dnsmasq
systemctl disable hostapd
systemctl disable dnsmasq

cp etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf
cp etc/systemd/system/rpi-hotspot.service /etc/systemd/system/rpi-hotspot.service
cp usr/bin/rpi-hotspot /usr/bin/rpi-hotspot

tee --append /etc/default/hostapd > /dev/null <<EOF
# Added by Poppy script
DAEMON_CONF="/etc/hostapd/hostapd.conf"
EOF

tee --append /etc/dnsmasq.conf > /dev/null <<EOF
# Added by Poppy script
# Hotspot configuration
no-resolv
interface=wlan0
bind-interfaces
dhcp-range=192.168.0.3,192.168.0.20,12h
EOF

sed -i 's/^auto lo$/auto lo wlan0/g' /etc/network/interfaces
sed -i '/iface wlan0 inet manual/{N;N;s/wpa-conf/# wpa-conf/'} /etc/network/interfaces

systemctl enable rpi-hotspot.service
