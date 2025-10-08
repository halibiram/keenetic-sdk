#!/bin/sh

[ "$type" == "ip6tables" ] && exit 0
[ "$table" != "filter" ] && exit 0

# Optimize OpenVPN traffic - MSS clamping for fragmentation
iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
iptables -t mangle -A POSTROUTING -o nwg+ -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1300

# Mark OpenVPN packets for QoS
iptables -t mangle -A POSTROUTING -o nwg+ -j MARK --set-mark 0x1