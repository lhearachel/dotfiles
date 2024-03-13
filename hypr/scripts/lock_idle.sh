#!/usr/bin/env bash

swayidle -w timeout 600 'swaylock -f' timeout 660 'hyperctl dispatch dpms off' resume 'hyperctl dispatch dpms on'
