#!/usr/bin/env bash

function apps {
	options="cancel\n1-firefox\n2-emacs\n3-thunar\n4-zigcider\n5-amphetype\n6-testemacs"
	selected=$(echo -e $options | /home/moena/.local/bin/dwmmenu)
	if [[ $selected = "1-firefox" ]]; then
		firefox
	elif [[ $selected = "2-emacs" ]]; then
		emacsclient -c
	elif [[ $selected = "3-thunar" ]]; then
		thunar
	elif [[ $selected = "4-zigcider" ]]; then
		emacs --with-profile prog
	elif [[ $selected = "5-amphetype" ]]; then
		$HOME/.local/bin/amphetype
	elif [[ $selected = "6-testemacs" ]]; then
		emacs --with-profile test
	fi
}

apps
