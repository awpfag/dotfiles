#!/bin/sh
day="$(date +%d)"
th=""

case "$day" in
	01 | 21 | 31)
		th="st"
	;;

	02 | 22)
		th="nd"
	;;

	03 | 23)
		th="rd"
	;;

esac

if [ "$th" = "" ]; then
	th="th"
fi

date="$(date "+%a %e"$th" %b, %H:%M")"
icon=""
echo "$icon $date"
