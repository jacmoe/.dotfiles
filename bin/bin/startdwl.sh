#!/bin/sh
wslstatus -s | dwl -s "exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP & 
exec /usr/libexec/polkit-mate-authentication-agent-1 &"
