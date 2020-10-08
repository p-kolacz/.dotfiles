#!/bin/bash

SEL_TAB_COLOR=42

id=$1
action=$2
tab=$3
user=$(whoami)

TABSF=/tmp/lf.$user.$id.tabs
INDXF=/tmp/lf.$user.$id.tabs.index

tab_line() {
	grep -P "^$1\t" $TABSF
}

add_tab() {
   	echo -e "$1\t$(pwd)" >> $TABSF
}

select_tab() {
	echo -n $1 > $INDXF
	# line=$(grep -P "^$1\t" $TABSF)
	line=$(tab_line $1)
	if [[ $? -eq 0 ]]; then
		echo "$line" | cut -f2
	else
		add_tab $1
		sort -V -o $TABSF $TABSF
		line=$(tab_line $1)
		echo "$line" | cut -f2
	fi
}

usage_exit() {
	echo "Usage: lftabs.sh id cd|current|list|select tab_no|next|prev|delete"
	exit 1
}

colorize() {
	printf "\e[${SEL_TAB_COLOR}m %s \e[0m" $1
}

if [[ ! -f $TABSF ]]; then
   	printf 1 > $INDXF
	add_tab 1
fi

case $action in
	cd)
		read current < $INDXF
		sed -i "/^$current\t/c\\$current\t$(pwd)" $TABSF
		echo $current
		;;
	current)
		cat $INDXF
		;;
	list)
		read current < $INDXF
		cut -f1 $TABSF | sed -e "s/.*/ & /" -e "s/^ $current \$/$(colorize $current)/" | tr -d "\n"
		;;
	select)
		[[ -z $tab ]] && usage_exit
		select_tab $tab
		;;
	next)
		read current < $INDXF
		count=$(wc -l < $TABSF)
		next=$((current % count + 1))
		select_tab $next
		;;
	prev)
		read current < $INDXF
		count=$(wc -l < $TABSF)
		prev=$(( (current - 2 + count) % count + 1))
		select_tab $prev
		;;
	delete)
		[[ $(wc -l < $TABSF) -eq 1 ]] && { echo "Can't delete last tab" && exit 2; }
		read current < $INDXF
		sed -i "/^$current\t/c\\" $TABSF
		first=$(cat $TABSF | cut -f1)
		select_tab $first
		;;
	*)
		usage_exit
		;;
esac

