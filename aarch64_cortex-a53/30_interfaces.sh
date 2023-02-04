#!/bin/sh

  uci set firewall.@zone[1].network='wan wan6 hilink tethering '
  uci set firewall.@defaults[0].forward='ACCEPT'
  uci set firewall.@zone[1].input='ACCEPT'
  uci set firewall.@zone[1].forward='ACCEPT'
  uci commit firewall

  uci del network.wan6
  uci set network.hilink=interface
  uci set network.hilink.ifname='eth1'
  uci set network.hilink.proto='dhcp'
  uci set network.tethering=interface
  uci set network.tethering.ifname='usb0'
  uci set network.tethering.proto='dhcp'
  uci set network.lan.dns="8.8.8.8 8.8.4.4" 
  uci commit network

  uci set system.@system[0]=system 
  uci set system.@system[0].hostname=KZERO
  uci set system.@system[0].zonename=Asia/Jakarta
  uci set system.@system[0].timezone=WIB-7
  uci commit system

  uci set dhcp.domain=domain
  uci set dhcp.domain.ip=192.168.1.1
  uci set dhcp.domain.name=KZERO
  uci commit dhcp

exit 0
