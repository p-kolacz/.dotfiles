#!/bin/bash

# youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 $1
youtube-dl -f bestaudio --extract-audio --add-metadata $1
