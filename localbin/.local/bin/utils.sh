#!/usr/bin/env bash

function utils {
	options="cancel\n1-htop\n2-weather\n3-pavucontrol\n"
	selected=$(echo -e $options | /home/moena/.local/bin/dwmmenu)
	if [[ $selected = "1-htop" ]]; then
		kitty -e htop
	elif [[ $selected = "2-weather" ]]; then
		kitty --hold -e /home/moena/go/bin/wego
	elif [[ $selected = "3-pavucontrol" ]]; then
		pavucontrol
	fi
}

utils
