#!/bin/sh
temp="$(sensors | grep 'Package id 0' | awk '{printf $4"\n"}' | sed 's/+//g')"
icon=""
echo " $icon $temp"
