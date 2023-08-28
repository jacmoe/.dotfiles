#!/usr/bin/env bash
lxpolkit &
picom &
nitrogen --restore &
slstatus &
dropbox start &
setxkbmap -layout us,no -variant colemak,colemak -option 'grp:shifts_toggle'
