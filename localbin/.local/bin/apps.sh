#!/usr/bin/env bash

function apps {
	options="cancel\n1-firefox\n2-emacs\n3-nautilus\n4-lagrange\n5-zigcider\n6-amphetype\n7-testemacs"
	selected=$(echo -e $options | /home/moena/.local/bin/dwmmenu)
	if [[ $selected = "1-firefox" ]]; then
		firefox
	elif [[ $selected = "2-emacs" ]]; then
		emacsclient -c
	elif [[ $selected = "3-nautilus" ]]; then
		nautilus
	elif [[ $selected = "4-lagrange" ]]; then
		lagrange
	elif [[ $selected = "5-zigcider" ]]; then
		emacs --with-profile prog
	elif [[ $selected = "6-amphetype" ]]; then
		$HOME/.local/bin/amphetype
	elif [[ $selected = "7-testemacs" ]]; then
		emacs --with-profile test
	fi
}

apps
