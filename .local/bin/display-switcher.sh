#!/bin/sh
no_of_monitors="$(xrandr -q | grep " connected" | awk {'printf $1 " "'} | wc -w)"

if [ "$no_of_monitors" -gt "1" ]; then
	xrandr --output eDP --auto --output HDMI-A-0 --auto --primary --right-of eDP
else
	xrandr --output eDP --auto --primary --output HDMI-A-0 --off
fi
