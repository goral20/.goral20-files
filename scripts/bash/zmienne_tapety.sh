#!/bin/bash

# ścieżki
d="/home/sebastian/Obrazy/# Wybrane Tapety pod system #/nge_zmienne_tapety/"
#d="/home/sebastian/Obrazy/# Wybrane Tapety pod system #/metro_zmienne_tapety/"
shopt -s nullglob
cd "$d" 
	
while true; do
		files=()
		for i in *.jpg *.png; do
				[[ -f $i ]] && files+=("$i")
		done
		range=${#files[@]}
						
		((range)) && feh --bg-fill "${files[RANDOM % range]}"
							
		sleep 5m
done
