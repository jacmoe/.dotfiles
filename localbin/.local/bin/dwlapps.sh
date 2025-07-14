#!/usr/bin/env bash

function apps {
	options="cancel\n1-firefox\n2-emacs\n3-spacefm\n4-okular\n5-odin\n6-ristretto"
	selected=$(echo -e $options | /home/moena/.local/bin/dwmmenu)
	if [[ $selected = "1-firefox" ]]; then
		firefox
	elif [[ $selected = "2-emacs" ]]; then
		emacs-pgtk
	elif [[ $selected = "3-spacefm" ]]; then
		spacefm
	elif [[ $selected = "4-okular" ]]; then
		okular
	elif [[ $selected = "5-odin" ]]; then
		emacs-pgtk --with-profile prog
	elif [[ $selected = "6-ristretto" ]]; then
		ristretto
	fi
}

apps
