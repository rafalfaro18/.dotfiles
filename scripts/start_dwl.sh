#!/bin/sh
slstatus -s | dwl -s "sh -c 'wlr-randr --output HDMI-A-1 --mode 1920x1080@60Hz && (mako && swaybg -i /home/pi/Pictures/wallhaven-vgyyxl.png) &'"
