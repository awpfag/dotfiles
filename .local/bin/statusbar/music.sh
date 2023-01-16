#!/bin/sh
status="$(playerctl --player=mpd status)"
output="$(playerctl --player=mpd metadata --format "{{ artist }} - {{ title }}")"

case "$status" in
	Stopped)
		exit 0
	;; 
	Playing)
		output=" ${output}"
	;;
	Paused)
		output=" ${output}" 
	;;
esac

char="$(echo $output | wc -m)"
limit="56"

if [ "$char" -gt "$limit" ]; then
	output="$(echo $output | cut -c -50)"
	output="${output}..."
fi
        
echo "$output"
