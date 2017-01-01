#!/bin/sh
# Sets eDP1 or DP2-1 as main screen + laptop screen as a secondary on the side

XRANDR_OUTPUT=$(xrandr -q)

xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal

if  echo $XRANDR_OUTPUT | grep -q "DP2-1 connected" ; then
	xrandr --output DP2-1 --primary --auto --left-of eDP1 --rotate normal
else 
	xrandr --output DP2-1 --off
fi
if  echo $XRANDR_OUTPUT | grep -q "DP2-2 connected" ; then
	xrandr --output DP2-2 --auto --left-of DP2-1 --rotate normal
else 
	xrandr --output DP2-2 --off
fi
if  echo $XRANDR_OUTPUT | grep -q "HDM1 connected" ; then
	xrandr --output HDM1 --auto --left-of eDP1 --rotate normal
else 
	xrandr --output HDM1 --off
fi
if  echo $XRANDR_OUTPUT | grep -q "DP1 connected" ; then
	xrandr --output DP1 --auto --left-of eDP1 --rotate normal
else 
	xrandr --output DP1 --off
fi

nitrogen --restore &

