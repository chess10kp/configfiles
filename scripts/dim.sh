#!/bin/bash

curr=$(brightnessctl g)
if [[ $1 == 100 ]]; then
	if [[ $curr -ne 100 ]]; then
		brightnessctl set 100
	fi
elif [[ $1 == 0 ]]; then
	if [[ $curr -ne 0 ]]; then
		brightnessctl set 0
	fi
fi
