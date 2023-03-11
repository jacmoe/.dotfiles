#!/usr/bin/env bash

function apps {
	options="cancel\n1-firefox\n2-emacs\n3-pomodoro\n4-thunar\n5-zigcider\n6-amphetype\n7-testemacs"
	selected=$(echo -e $options | /home/moena/.local/bin/dwmmenu)
	if [[ $selected = "1-firefox" ]]; then
		firefox
	elif [[ $selected = "2-emacs" ]]; then
		emacsclient -c
	elif [[ $selected = "3-pomodoro" ]]; then
		pomotroid
	elif [[ $selected = "4-thunar" ]]; then
		thunar
	elif [[ $selected = "5-zigcider" ]]; then
		emacs --with-profile prog
	elif [[ $selected = "6-amphetype" ]]; then
		$HOME/.local/bin/amphetype
	elif [[ $selected = "7-testemacs" ]]; then
		emacs --with-profile test
	fi
}

apps
