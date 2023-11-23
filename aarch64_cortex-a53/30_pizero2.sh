#!/bin/sh

  uci set firewall.@zone[1].network='wan wan6 hilink tethering fibocom'
  uci set firewall.@defaults[0].forward='ACCEPT'
  uci set firewall.@zone[1].input='ACCEPT'
  uci set firewall.@zone[1].forward='ACCEPT'
  uci commit firewall

  uci del network.wan6
  uci del network.cfg030f15.ports
  uci set network.hilink=interface
  uci set network.hilink.device='eth0'
  uci set network.hilink.proto='dhcp'
  uci set network.tethering=interface
  uci set network.tethering.device='usb0'
  uci set network.tethering.proto='dhcp'
  uci set network.fibocom=interface
  uci set network.fibocom.proto='xmm'
  uci add_list network.cfg030f15.ports='end0'
  uci add_list network.lan.dns='8.8.8.8'
  uci add_list network.lan.dns='8.8.4.4
  uci commit network

  uci set system.@system[0]=system 
  uci set system.@system[0].hostname=Pizero2
  uci set system.@system[0].zonename=Asia/Jakarta
  uci set system.@system[0].timezone=WIB-7
  uci commit system

  uci set dhcp.domain=domain
  uci set network.lan.ipaddr='192.168.10.1'
  uci set dhcp.domain.name=Pizero2
  uci commit dhcp
  chmod +x /etc/profile
  chmod +x /usr/bin/sysinfo
  chmod +x /etc/openclash/core/*
  rm /etc/profile.d/*-sysinfo.sh
exit 0
