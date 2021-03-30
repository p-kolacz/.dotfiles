lua Plug.add 'diepm/vim-rest-console'

let g:vrc_trigger = '<F5>'
let g:vrc_response_default_content_type = 'application/json'
let g:vrc_split_request_body = 1

let g:vrc_curl_opts = {
	\ '--silent': '',
	\ '--show-error': '',
\ }
