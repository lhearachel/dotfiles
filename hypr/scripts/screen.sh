#!/usr/bin/env bash

case $1 in
s) # Manually select an area
	grimblast copy area ;;
sf) # Freeze the screen, then select an area
	grimblast --freeze copy area ;;
m) # Currently-focused monitor
	grimblast copy output ;;
*) # Invalid option
	;;
esac
