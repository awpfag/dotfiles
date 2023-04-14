cd ~/
rm -rf ~/.cache/screenshots/*
mpd &
mpDris2 &
sxhkd &

if [ "$2" = "kde" ]; then
	export desktop_session=plasma
	exec startplasma-x11
else
	dwmblocks &
	xwallpaper --zoom ~/pictures/wallpapers/animals/deer-fighting.jpg
	exec dwm
fi
