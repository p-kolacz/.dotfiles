#!/bin/bash

sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(grep -Ev '#|^$' pkglist.txt | sort))

