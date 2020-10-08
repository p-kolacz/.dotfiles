#!/bin/bash

id=$1
tab=$2
action=$3
user=$(whoami)

HISTF=/tmp/lf.$user.$id.$tab.dirstory			# history list
INDXF=/tmp/lf.$user.$id.$tab.dirstory.index		# 1-based index of current dir in history
LOCKF=/tmp/lf.$user.$id.$tab.dirstory.lock		# lock when navigating


echo_nth_line() {
	tail -n+$1 $HISTF | head -1
}

case $action in
	push)
		if [[ -e $LOCKF ]]; then
			rm $LOCKF
			exit 5
		else
			pwd >> $HISTF
		   	wc -l < $HISTF > $INDXF
		fi ;;
	back)
		[[ -e $INDXF ]] || { echo "History is empty" && exit 1; }
		idx=$(cat $INDXF)
		if [[ $idx -eq 1 ]]; then
			echo "Already at the begining"
			exit 2
		else
			new_idx=$((idx - 1))
			echo $new_idx > $INDXF
			touch $LOCKF
			echo_nth_line $new_idx 
		fi ;;
	forward)
		[[ -e $INDXF ]] || { echo "History is empty" && exit 1; }
		idx=$(cat $INDXF)
		max=$(wc -l < $HISTF)
		if [[ $idx -eq $max ]]; then
			echo "Already at the end"
			exit 3
		else
			new_idx=$((idx + 1))
			echo $new_idx > $INDXF
			touch $LOCKF
			echo_nth_line $new_idx 
		fi ;;
	lock)
		touch $LOCKF
		;;
	*)
		echo "Usage: dirstory.sh id push|back|forward|lock"
		exit 10 ;;
esac

