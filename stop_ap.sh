#!/bin/bash

IFNAME="wlp7s0f3u3i2"

sudo sysctl net.ipv4.ip_forward=0
sudo ip a f dev $IFNAME
sudo nft flush ruleset
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd
