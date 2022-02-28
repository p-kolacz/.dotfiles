-- Sign column icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- local sign = vim.fn.sign_define
-- sign("LspDiagnosticsSignError",			{ text = "", texthl = "LspDiagnosticsSignError" })
-- sign("LspDiagnosticsSignWarning",		{ text = "", texthl = "LspDiagnosticsSignWarning" })
-- sign("LspDiagnosticsSignInformation",	{ text = "", texthl = "LspDiagnosticsSignInformation" })
-- sign("LspDiagnosticsSignHint",			{ text = "", texthl = "LspDiagnosticsSignHint" })

-- Completion menu icons
-- local kind = require'vim.lsp.protocol'.CompletionItemKind
-- kind[1] = ''			-- Text
-- kind[2] = 'ƒ'			-- Method
-- kind[3] = ''			-- Function
-- kind[4] = ''			-- Constructor
-- kind[5] = ''			-- Field
-- kind[6] = ''			-- Variable
-- kind[7] = ''			-- Class
-- kind[8] = 'ﰮ'			-- Interface
-- kind[9] = ''			-- Module
-- kind[10] = ''			-- Property
-- kind[11] = ''			-- Unit
-- kind[12] = ''			-- Value
-- kind[13] = ''			-- Enum
-- kind[14] = ''			-- Keyword
-- kind[15] = '﬌'			-- Snippet
-- kind[16] = ''			-- Color
-- kind[17] = ''			-- File
-- -- kind[18] = ''			-- Reference
-- kind[19] = ''			-- Folder
-- kind[20] = ''			-- EnumMember
-- kind[21] = ''			-- Constant
-- -- kind[22] = ''			-- Struct
-- -- kind[23] = ''			-- Event
-- kind[24] = ''			-- Operator
-- -- kind[25] = ''			-- TypeParameter
