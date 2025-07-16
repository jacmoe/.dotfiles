#!/usr/bin/env bash

function apps {
	options="cancel\n1-firefox\n2-odin\n3-spacefm\n4-okular\n5-writing\n6-ristretto"
	selected=$(echo -e $options | /home/moena/.local/bin/dwmmenu)
	if [[ $selected = "1-firefox" ]]; then
		firefox
	elif [[ $selected = "2-odin" ]]; then
		emacs-pgtk --with-profile prog
	elif [[ $selected = "3-spacefm" ]]; then
		spacefm
	elif [[ $selected = "4-okular" ]]; then
		okular
	elif [[ $selected = "5-writing" ]]; then
		emacs-pgtk
	elif [[ $selected = "6-ristretto" ]]; then
		ristretto
	fi
}

apps
