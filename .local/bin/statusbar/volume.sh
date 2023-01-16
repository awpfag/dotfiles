#!/bin/sh
volume="$(pamixer --get-volume-human)"

if [ "$volume" = "muted" ]; then
	icon=""
	volume=""
else 
	icon=" "
fi

echo "$icon$volume"
