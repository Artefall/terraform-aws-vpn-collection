#!/bin/bash

sudo apt update
sudo apt install pptpd


sudo service pptpd restart

sudo echo "net.ipv4.ip_forward=1" >> /etc/systctl.conf
sudo sysctl -p
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save
