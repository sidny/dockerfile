#! /bin/bash

# Enable ip forward
sysctl -w net.ipv4.ip_forward=1

# Configure forward
iptables -A INPUT -p tcp -m state --state NEW --dport 443 -j ACCEPT
iptables -A INPUT -p udp -m state --state NEW --dport 443 -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE

# Start ocserv
ocserv -f -d 1