#!/bin/sh
network="$(nmcli device | grep 'wifi ' | awk '{print $4}')"

icon=""

if [ "$network" = "--" ]; then
	echo "$icon disconnected"
	exit 0
fi

vpn_status="$(nmcli device | grep 'wg0' | awk '{printf $3}')"
if [ "$vpn_status" = "connected" ]; then
	vpn_icon=" "
else
	vpn_icon=""
fi

echo "$icon $network$vpn_icon"
