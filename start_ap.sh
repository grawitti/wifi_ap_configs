#!/bin/bash

# имя wi-fi интерфейса
IFNAME="wlp7s0f3u3i2"

# имя WAN интерфейса
OIF="enp6s0"

SUDO=""

#если адаптер заблокирован, то раскомментируйте строку:
$SUDO rfkill unblock all 

$SUDO ifconfig $IFNAME 192.168.150.1
$SUDO systemctl start dnsmasq 
$SUDO sysctl net.ipv4.ip_forward=1
#Если iptables
#$SUDO iptables -t nat -A POSTROUTING -o $IFNAME -j MASQUERADE
#Если nftables
$SUDO nft -f /etc/nftables.conf
#$SUDO nft add rule ip nat POSTROUTING oifname $OIF counter masquerade
$SUDO systemctl start hostapd
#$SUDO hostapd /etc/hostapd.conf

#останавливаем запущенные сервисы, после нажатия Ctrl+C или если точка не запустилась:
#$SUDO sysctl net.ipv4.ip_forward=0
#$SUDO systemctl stop dnsmasq
#$SUDO systemctl stop hostapd
