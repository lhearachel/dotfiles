#!/bin/sh
xrandr --output Virtual1 --mode 1920x1080
xset -b
picom --no-fading-openclose &
unclutter --jitter 10 --ignore-scrolling --start-hidden --fork

