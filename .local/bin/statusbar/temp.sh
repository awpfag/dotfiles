#!/bin/sh
temp="$(sensors | grep Other | awk '{printf $2"\n"}' | sed 's/+//g' | sed 's/.0//g')"
icon=""
echo "$icon $temp"
