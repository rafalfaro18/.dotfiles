#!/bin/sh
#laptop
#xrandr --output DP-2 --mode 2880x1800 --rate 59.99 --scale 0.67x0.67
# disable laptop screen
xrandr --output DP-2 --off
#hdmi
xrandr --output HDMI-0 --mode 2560x1440 --primary
# Ultrawide Vertical
xrandr --output DP-0 --mode 2560x1080 --rate 59.98 --rotate right
# adjust resolution before wallpaper or it'll distort
feh --bg-scale ~/Pictures/wallhaven-vgyyxl.png &
# uncomment dunst if not autostarting service
#dunst &
picom &
slstatus &
exec dwm
