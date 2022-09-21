#!/bin/bash

# Script arguments
FILE_PATH="$1"         # Full path of the highlighted file
PV_WIDTH="$2"          # Width of the preview pane (number of fitting characters)
PV_HEIGHT="$3"         # Height of the preview pane (number of fitting characters)

# lf mode
[[ -z $PV_HEIGHT ]] && PV_HEIGHT=$PV_WIDTH && PV_WIDTH=80

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION="${FILE_EXTENSION,,}"

# PV_HEIGHT=10
limit() {
	head -n $PV_HEIGHT
}

limit_a() {
	head -n $PV_HEIGHT $1
}

syn_highlight_a() {
	# bat --style=plain  --color=always "$1"
	case $THEME in
		grubox-dark)
			hl_theme=base16/gruvbox-dark-medium ;;
		nord)
			hl_theme=nord ;;
		*)
			hl_theme=base16/nord ;;
	esac
	highlight -O xterm256 -s $hl_theme --force "$1"
}

binary() {
	FILE_PATH="$1"
	file --dereference --brief "$FILE_PATH" | sed "s/, /\n/g"
	[[ -s $FILE_PATH ]] && hexyl --length=512 --no-position --no-squeezing "$FILE_PATH"
}

file -b "$FILE_PATH" && echo "────────────────────────────────────────"

case "$FILE_EXTENSION" in
	bmp|gif|ico|jpg|jpeg|png|tiff|webp)
		mediainfo "$FILE_PATH"
		# exit 7 for ranger
		exit 7 ;;

	flac|mp3|ogg|wav)
		mediainfo "$FILE_PATH" && exit 0 ;;

	it|mod|s3m|xm)
		mediainfo "$FILE_PATH"
		exit 0
		;;

	pdf)
		# pdftotext -l 10 -nopgbrk -q -- "$FILE_PATH" - | fmt -w "$PV_WIDTH" && exit 0;;
		pdftotext -l 10 -nopgbrk -q -- "$FILE_PATH" - && exit 0;;

	torrent)
		transmission-show -- "$" && exit 0;;

	odt|ods|odp|sxw)
		odt2txt "$FILE_PATH" && exit 0
		pandoc -s -t markdown -- "$FILE_PATH" && exit 0
		exit 1;;

	doc)
		catdoc "$FILE_PATH" && exit 0;;

	docx)
		docx2txt.pl "$FILE_PATH" - && exit 0;;
	# xlsx)
		## Uses: https://github.com/dilshod/xlsx2csv
		# xlsx2csv -- "$FILE_PATH" && exit 0;;
	# htm|html|xhtml)
		## Preview as text conversion
		# w3m -dump "$FILE_PATH" && exit 0
		# lynx -dump -- "$FILE_PATH" && exit 0
		# elinks -dump "$FILE_PATH" && exit 0
		# pandoc -s -t markdown -- "$FILE_PATH" && exit 0
		# ;;

	# htaccess|c|cl|cljs|conf|cpp|cs|css|fish|gd|h|hs|html|ini|java|js|lua|php|py|rb|rc|ru|sh|sql|vim|xml|yaml|yml)
		# syn_highlight_a "$FILE_PATH" && exit 0;;

	csv)
		echo -n "Lines: "
		wc -l < "$FILE_PATH"
		# limit_a "$FILE_PATH" | column -s , -t && exit 0;;
		limit_a "$FILE_PATH" | xsv table && exit 0;;
		# limit_a "$FILE_PATH" && exit 0;;

	# json)
		# jq --color-output . "$FILE_PATH" && exit 0
		# python -m json.tool -- "$FILE_PATH" | syn_highlight && exit 0
		# syn_highlight_a "$FILE_PATH" && exit 0
		# ;;

	3gp|avi|flv|m4v|mkv|mov|mp4|mpg|mpeg|ogv|qt|vob|webm|wmv)
		mediainfo "$FILE_PATH" && exit 0
		# ffprobe -pretty "$FILE_PATH" && exit 0
		;;

	apk|bz|bz2|cab|deb|gz|jar|rpm|tar|tgz|xz|zip)
		# bsdtar --list --file "$FILE_PATH" | limit && exit 0;;
		bsdtar --list --file "$FILE_PATH" && exit 0;;

	rar)
		## Avoid password prompt by providing empty password
		# unrar lt -p- -- "${FILE_PATH}" | limit && exit 0;;
		unrar lt -p- -- "${FILE_PATH}" && exit 0;;

	7z)
		## Avoid password prompt by providing empty password
		# 7z l -p -- "${FILE_PATH}" | limit && exit 0;;
		7z l -p -- "${FILE_PATH}" && exit 0;;
	# torrent)
		# dumptorrent -v %c && exit 0 ;;
esac

file --dereference --mime-encoding "$FILE_PATH" | grep -q binary \
	&& binary "$FILE_PATH" || syn_highlight_a "$FILE_PATH"

