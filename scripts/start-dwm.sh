#!/bin/sh
#hdmi
xrandr --output HDMI-0 --mode 1920x1080
#laptop
xrandr --output DP-2 --mode 2880x1800 --rate 59.99 --scale 0.8x0.8
# adjust resolution before wallpaper or it'll distort
feh --bg-scale ~/Pictures/wallhaven-vgyyxl.png &
# uncomment dunst if not autostarting service
#dunst &
picom &
slstatus &
exec dwm
