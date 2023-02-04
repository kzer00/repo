#!/bin/sh

  uci set wireless.@wifi-device[0].disabled=0
  uci set wireless.@wifi-iface[0].device=radio0
  uci set wireless.@wifi-iface[0].mode=ap
  uci set wireless.@wifi-iface[0].ssid=AkariAmlogic
  uci set wireless.@wifi-iface[0].network=lan
  uci set wireless.@wifi-iface[0].encryption=psk2
  uci set wireless.@wifi-iface[0].key=internet
  uci set wireless.radio0.htmode='VHT20'
  uci set wireless.radio0.band='5g'
  uci set wireless.radio0.channel='128'
  uci set wireless.radio0.cell_density='0'
  uci commit wireless

exit 0
