#!/bin/bash

source $HOME/.dotfiles/lib/blocks.sh

# while true; do
# 	echo %{r}%{B#33333300}$(bat) %{B#000000} $(cpu)
# 	sleep 1
# done

while read -r line; do
	case $line in
		D*)
			date=${line#?} ;;
	esac
	echo %{r}$date
done

