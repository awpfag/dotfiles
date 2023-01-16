cd ~/
rm -rf ~/.cache/screenshots/*
mpd &
mpDris2 &
sxhkd &
xset -dpms

export desktop_session=plasma
exec startplasma-x11
