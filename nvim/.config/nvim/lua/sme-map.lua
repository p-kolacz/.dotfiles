local function set(mode, lhs, rhs, desc, opts)
	if desc and WK then
		opts.silent = false
		opts.mode = mode
		desc = desc == "" and "which_key_ignore" or desc
		WK.register({ [lhs] = { rhs, desc }}, opts)
	elseif type(rhs) == "string" then
		if opts.buffer then
			opts.buffer = nil
			vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
		else
			vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
		end
	else
		print("invalid rhs for: "..lhs)
	end
end

function mapgroup(key, desc)
	if WK then
		WK.register({ [key] = { name = desc }})
	end
end

function map(lhs, rhs, desc)              set("i", lhs, rhs, desc, { noremap = false })             end
function inoremap(lhs, rhs, desc)         set("i", lhs, rhs, desc, { noremap = true  })             end
function inoremap_buffer(lhs, rhs, desc)  set("i", lhs, rhs, desc, { noremap = true, buffer = 0  }) end
function nnoremap(lhs, rhs, desc)         set("n", lhs, rhs, desc, { noremap = true  })             end
function nnoremap_buffer(lhs, rhs, desc)  set("n", lhs, rhs, desc, { noremap = true, buffer = 0  }) end
function vnoremap(lhs, rhs, desc)         set("v", lhs, rhs, desc, { noremap = true  })             end
function vnoremap_buffer(lhs, rhs, desc)  set("v", lhs, rhs, desc, { noremap = true, buffer = 0  }) end
function xnoremap(lhs, rhs, desc)         set("x", lhs, rhs, desc, { noremap = true  })             end
function xnoremap_buffer(lhs, rhs, desc)  set("x", lhs, rhs, desc, { noremap = true, buffer = 0  }) end

