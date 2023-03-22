#!/usr/bin/env bash

function apps {
	options="cancel\n1-firefox\n2-qutebrowser\n3-emacs\n4-thunar\n5-lagrange\n6-zigcider\n7-amphetype\n8-testemacs"
	selected=$(echo -e $options | /home/moena/.local/bin/dwmmenu)
	if [[ $selected = "1-firefox" ]]; then
		firefox
	elif [[ $selected = "2-qutebrowser" ]]; then
		qutebrowser
	elif [[ $selected = "3-emacs" ]]; then
		emacsclient -c
	elif [[ $selected = "4-thunar" ]]; then
		thunar
	elif [[ $selected = "5-lagrange" ]]; then
		lagrange
	elif [[ $selected = "6-zigcider" ]]; then
		emacs --with-profile prog
	elif [[ $selected = "7-amphetype" ]]; then
		$HOME/.local/bin/amphetype
	elif [[ $selected = "8-testemacs" ]]; then
		emacs --with-profile test
	fi
}

apps
