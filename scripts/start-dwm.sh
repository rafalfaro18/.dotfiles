#!/bin/sh
feh --bg-scale ~/Pictures/wallhaven-vgyyxl.png &
# uncomment dunst if not autostarting service
#dunst &
picom &
slstatus &
exec dwm
