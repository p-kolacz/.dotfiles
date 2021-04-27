" https://github.com/liuchengxu/vim-which-key

lua Plug.add 'liuchengxu/vim-which-key'

nnoremap <silent> <space> :<c-u>WhichKey '<space>'<CR>
nnoremap <silent> , :<c-u>WhichKey ','<CR>

set timeoutlen=500
" let g:which_key_vertical = 1					" doesn't work well
" let g:which_key_disable_default_offset = 0	" doesn't work?
let g:which_key_sort_horizontal = 1
let g:which_key_map = {}

function! Desc(key, desc)
	let path = split(a:key, '\zs')		" split by chars
	let length = len(path)
	let i = 0
	let ref = g:which_key_map
	for v in path
		if i == length - 1
			if a:desc[0] == '+'
				if !has_key(ref, v)
					let ref[v] = { 'name': a:desc }
				else
					let ref[v].name = a:desc
				endif
			else
				let ref[v] = a:desc	
			endif
		else
			if !has_key(ref, v)	
				let ref[v] = {}
			endif
			let ref = ref[v]
		endif
		let i += 1
	endfor
endfunction	

function! DescIgnore(key)
	call Desc(a:key, 'which_key_ignore')
endfunction

command! -nargs=+ Desc call Desc(<f-args>)

command! -nargs=1 DescIgnore call DescIgnore(<f-args>)

Desc c +Code
Desc i +Insert
Desc o +Options
Desc t +Tools
Desc v +Vim

call which_key#register('<Space>', "g:which_key_map")

