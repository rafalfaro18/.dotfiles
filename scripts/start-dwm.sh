#!/bin/sh
feh --bg-scale /home/oldmac/Pictures/wallhaven-vgyyxl.png &
# uncomment dunst if not autostarting service
#dunst &
picom &
slstatus &
exec dwm
