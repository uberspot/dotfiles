#!/bin/sh
# Sets VGA1 or HDMI1 as main screen + laptop screen as a secondary on the side

if xrandr -q | grep -q "VGA1 connected" ; then
	xrandr --output HDMI1 --off --output LVDS1 --off --output VGA1 --primary --mode 1920x1200 --pos 0x0 --rotate normal
elif xrandr -q | grep -q "HDMI1 connected" ; then
	xrandr --output VGA1 --off --output LVDS1 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
else
	xrandr --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VGA1 --off --output HDMI1 --off
fi

nitrogen --restore &
