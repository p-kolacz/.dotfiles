#!/bin/bash

FILE_PATH=$1

[[ $# -eq 0 ]] && { echo "Usage: run.sh filepath"; exit 1; }

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION="${FILE_EXTENSION,,}"

case $FILE_EXTENSION in
	html)
		$BROWSER "$FILE_PATH" ;;
	epub|mobi)
		ebook-viewer -- "$FILE_PATH" ;;
	cbr|cbz|djvu|pdf)
		zathura -- "$FILE_PATH" ;;
	bmp|dng|gif|jpg|jpeg|png|svg|tiff|webp)
		nsxiv-rifle "$FILE_PATH" > /dev/null ;;
	otf|ttf)
		gnome-font-viewer -- "$FILE_PATH" ;;
	3gp|avi|flv|m4v|mkv|mov|mp4|mpg|mpeg|ogv|qt|vob|webm|wmv)
		mpv -- "$FILE_PATH" & ;;
	flac|m4a|mp3|ogg|wav|wma)
		ffplay -nodisp -autoexit "$FILE_PATH" ;;
		# mpv -- "$FILE_PATH" & ;;
	ods)
		gnumeric "$FILE_PATH" ;;
	doc|docx|odp|odt|ppt|pptx|xls|xlsx)
		libreoffice "$FILE_PATH" ;;
	jar|zip)
		# fuse-zip
		;;
	bz2|gz|tar|tgz|xz)
		# archivemount
		;;
	ftp)
		# curlftpfs
		;;
	ssh)
		# sshfs
		;;
	md5)
		md5sum -c -- "$FILE_PATH" ;;
	sha1)
		sha1sum -c -- "$FILE_PATH" ;;
	sha256)
		sha256sum -c -- "$FILE_PATH" ;;
	sha512)
		sha512sum -c -- "$FILE_PATH" ;;
	lego)
		;;
	# *)
		# file --dereference --mime-encoding "$FILE_PATH" | grep -q binary \
			# || $EDITOR "$FILE_PATH" ;;
esac


