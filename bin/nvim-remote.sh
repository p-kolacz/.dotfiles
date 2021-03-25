#!/bin/bash

server=$(nvr --serverlist | head -n 1)

nvr --nostart --servername "$server" "$1" -c "$2" &

