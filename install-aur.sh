#!/bin/bash

yay -S --needed $(comm -13 <(pacman -Slq | sort ) <(grep -Ev '#|^$' pkglist.txt | sort))

