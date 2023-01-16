#!/bin/sh
icon=""
ram_usage="$(free -h | grep Mem | awk '{print $3}' | sed 's/Gi/gb/g' | sed 's/Mi/mb/g')"

echo "$icon $ram_usage"
