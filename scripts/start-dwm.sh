#!/bin/sh

# Give the X server a brief moment to fully initialize the hardware ports
sleep 1

# Re-initialize all connected screens to clear stuck Xorg cache
xrandr --auto

# uncomment dunst if not autostarting service
#dunst &
picom &
slstatus &

# Swap primary status FIRST, then alter layout and disable the laptop
xrandr --output HDMI-0 --mode 2560x1440 --primary \
       --output DP-0 --mode 2560x1080 --rate 59.98 --rotate right --right-of HDMI-0 \
       --output DP-2 --off
# Background applications
feh --bg-scale ~/Pictures/wallhaven-vgyyxl.png &
# Launch window manager
exec dwm
