#!/bin/bash

sudo apt update
sudo apt install pptpd

echo -e "${pptp_config}" >> /etc/pptpd.conf
echo -e "${chap_secrets}" >> /etc/ppp/chap-secrets
echo -e "${pptpd_options}" >> /etc/ppp/chap-secrets

sudo service pptpd restart

sudo echo "net.ipv4.ip_forward=1" >> /etc/systctl.conf
sudo sysctl -p
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save
