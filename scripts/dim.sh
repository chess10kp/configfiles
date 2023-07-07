#!/bin/bash

curr=$(brightnessctl g)
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
	case $1 in
	-V | --version)
		echo "1.0"
		exit
		;;
	-s | --string)
		shift
		string=$1
		;;
	-f | --flag)
		flag=1
		;;
	esac
	shift
done
if [[ "$1" == '--' ]]; then shift; fi

if [[ $1 == 100 ]]; then
	if [[ $curr -ne 100 ]]; then
		brightnessctl set 100
	fi
elif [[ $1 == 0 ]]; then
	if [[ $curr -ne 0 ]]; then
		brightnessctl set 0
	fi
fi
