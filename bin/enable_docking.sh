#!/bin/sh

if [ $(xrandr -q | grep HDMI2 | cut -d' ' -f2) == "connected" ]; then
    xrandr --output HDMI2 --auto --output eDP1 --auto --right-of HDMI2
fi
