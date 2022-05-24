#!/bin/bash

IN="eDP-1"
EXT="DP-1"

if (xrandr | grep "$EXT disconnected"); then
    xrandr --output $IN --mode 1600x900 --output $EXT --off
else
    xrandr --output $IN --mode 1600x900 --primary --output $EXT --auto --right-of $IN
    # xrandr -s 1600x900
fi
