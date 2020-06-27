#!/bin/bash

source $HOME/.dotfiles/lib/blocks.sh

while true; do
	echo %{r}$(bat) $(cpu)
	sleep 1
done

