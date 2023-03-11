#!/usr/bin/env bash

function utils {
	options="cancel\n1-htop\n2-weather\n3-alsamixer\n"
	selected=$(echo -e $options | /home/moena/.local/bin/dwmmenu)
	if [[ $selected = "1-htop" ]]; then
		kitty -e htop
	elif [[ $selected = "2-weather" ]]; then
		kitty --hold -e wego
	elif [[ $selected = "3-alsamixer" ]]; then
		kitty --hold -e alsamixer
	fi
}

utils
