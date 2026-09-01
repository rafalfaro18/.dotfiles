#!/bin/sh

# Give the X server a brief moment to fully initialize the hardware ports
sleep 1

# Re-initialize all connected screens to clear stuck Xorg cache
xrandr --auto

# Count how many monitors are physically connected
CONNECTED_MONITORS=$(xrandr | grep -c " connected")

# uncomment dunst if not autostarting service
#dunst &
picom &
slstatus &

# Swap primary status FIRST, then alter layout.
# Only turn off DP-2 if 3 or more total monitors are detected.
if [ "$CONNECTED_MONITORS" -gt 2 ]; then
    xrandr --output HDMI-0 --mode 2560x1440 --primary \
           --output DP-0 --mode 2560x1080 --rate 59.98 --rotate right --right-of HDMI-0 \
           --output DP-2 --off
else
    # Fallback layout when only 1 or 2 monitors are connected (DP-2 remains untouched)
    xrandr --output HDMI-0 --mode 2560x1440 --primary \
           --output DP-0 --mode 2560x1080 --rate 59.98 --rotate right --left-of HDMI-0
fi

# Background applications
feh --bg-fill ~/Pictures/wallhaven-vgyyxl.png &
# Launch window manager
exec dwm
