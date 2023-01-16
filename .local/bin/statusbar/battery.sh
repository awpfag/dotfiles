#!/bin/sh
status="$(cat /sys/class/power_supply/BAT0/status)"
charge="$(cat /sys/class/power_supply/BAT0/capacity)"

if [ "$charge" -gt "100" ]; then
	charge="100%"
fi

if [ "$status" = "Charging" ]; then
	icon=""
else
	icon=""
fi

echo "$icon $charge%"
