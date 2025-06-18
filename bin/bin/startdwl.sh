#!/bin/sh
slstatus -s | dwl -s "exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP & 
lxpolkit &"
