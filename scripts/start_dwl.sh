#!/bin/sh
# mako should go last
slstatus -s | dwl -s "sh -c 'wlr-randr --output HDMI-A-1 --mode 1920x1080@60Hz & swaybg -i ~/Pictures/wallhaven-vgyyxl.png & mako & nm-applet --indicator & <&-'"

killall mako
