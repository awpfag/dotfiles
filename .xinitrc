cd ~/
rm -rf ~/.cache/screenshots/*
mpd &
mpDris2 &
sxhkd &
export desktop_session=plasma
exec startplasma-x11
