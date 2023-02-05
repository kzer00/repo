#!/bin/sh
uci del wireless.default_radio0.disabled
uci del wireless.radio0.disabled
uci set wireless.radio0.htmode='VHT20'
uci set wireless.radio0.cell_density='0'
uci set wireless.default_radio0.ssid='OpenWrt-Amlogic'
uci set wireless.default_radio0.encryption='psk2'
uci set wireless.default_radio0.key='internet'
uci commit wireless

exit 0
