-- Sign column icons
local sign = vim.fn.sign_define
sign("LspDiagnosticsSignError",			{ text = "", texthl = "LspDiagnosticsSignError" })
sign("LspDiagnosticsSignWarning",		{ text = "", texthl = "LspDiagnosticsSignWarning" })
sign("LspDiagnosticsSignInformation",	{ text = "", texthl = "LspDiagnosticsSignInformation" })
sign("LspDiagnosticsSignHint",			{ text = "", texthl = "LspDiagnosticsSignHint" })

-- Completion menu icons
print(vim.inspect(require'vim.lsp.protocol'.CompletionItemKind))
