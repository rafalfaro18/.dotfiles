#!/bin/sh
#hdmi
xrandr --output HDMI-0 --mode 2560x1440
#laptop
xrandr --output DP-2 --mode 2880x1800 --rate 59.99 --scale 0.67x0.67
# adjust resolution before wallpaper or it'll distort
feh --bg-scale ~/Pictures/wallhaven-vgyyxl.png &
# uncomment dunst if not autostarting service
#dunst &
picom &
slstatus &
exec dwm
