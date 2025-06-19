#!/bin/sh
slstatus -s | dwl -s "exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP GDK_BACKEND=wayland & 
exec /usr/libexec/polkit-mate-authentication-agent-1 &"
