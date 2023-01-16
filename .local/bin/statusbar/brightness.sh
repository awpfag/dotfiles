#!/bin/sh
brightness="$(brightnessctl -m i | sed 's/,/ /g' | awk {'printf $4"\n"'})"
icon=""

echo "$icon $brightness"
