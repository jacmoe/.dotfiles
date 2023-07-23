#!/usr/bin/env bash

function apps {
	options="cancel\n1-firefox\n2-emacs\n3-thunar\n4-evince\n5-zigcider\n6-amphetype\n7-testemacs"
	selected=$(echo -e $options | /home/moena/.local/bin/dwmmenu)
	if [[ $selected = "1-firefox" ]]; then
		firefox
	elif [[ $selected = "2-emacs" ]]; then
		export PATH="/home/moena/.doom.emacs.d/bin:$PATH"&&export DOOMDIR="/home/moena/.doom.d"&&doom run
	elif [[ $selected = "3-thunar" ]]; then
		thunar
	elif [[ $selected = "4-evince" ]]; then
		evince
	elif [[ $selected = "5-zigcider" ]]; then
		emacs --with-profile prog
	elif [[ $selected = "6-amphetype" ]]; then
		$HOME/.local/bin/amphetype
	elif [[ $selected = "7-testemacs" ]]; then
		emacs --with-profile test
	fi
}

apps
