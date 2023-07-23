#!/usr/bin/env bash
lxpolkit &
picom &
nitrogen --restore &
slstatus &
setxkbmap -layout us,no -variant colemak,colemak -option 'grp:shifts_toggle'
