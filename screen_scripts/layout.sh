#!/bin/bash

opt1="monitor"
opt2="laptop"
opt3="both"
if [ "$1" = "$opt1" ]; then
xrandr --output eDP --off --output HDMI-A-0 --mode 1600x900 --pos 0x0 --rotate normal
elif [ "$1" = "$opt2" ]; then
xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --off
elif [ "$1" = "$opt3" ]; then
xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1600x900 --pos 1920x0 --rotate normal
else
	printf "provide options\nex: 'layout.sh monitor'\noptions:\n\tmonitor\n\tlaptop\n\tboth"
fi

# xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1600x900 --pos 1920x0 --rotate normal
