if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	" au! BufNewFile,BufRead *.csv setf csv
	au! BufNewFile,BufRead *.xresources setf xdefaults
augroup END

