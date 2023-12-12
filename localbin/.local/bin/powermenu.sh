#!/usr/bin/bash
#echo -e "poweroff\nreboot\nsuspend" | dmenu | xargs systemctl
echo -e "poweroff\nreboot\n" | /home/moena/.local/bin/dwmmenu | xargs systemctl
