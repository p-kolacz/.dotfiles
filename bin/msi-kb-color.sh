#!/bin/bash

color=$(echo -e "red\ngreen\nblue\nwhite" | dmenu -p "  ")
[[ -n $color ]] && sudo msiklm $color

