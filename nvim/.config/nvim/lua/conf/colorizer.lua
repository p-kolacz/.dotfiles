-- Run after install 'make hexokinase'

Plugin "https://github.com/RRethy/vim-hexokinase"

-- vim.g.Hexokinase_highlighters = { 'virtual' }
vim.g.Hexokinase_highlighters = { 'backgroundfull' }


--  All possible highlighters
-- 'virtual',
-- 'sign_column',
-- 'background',
-- 'backgroundfull',
-- 'foreground',
-- 'foregroundfull'

-- Patterns to match for all filetypes
-- Can be a comma separated string or a list of strings
vim.g.Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla'

-- " All possible values
-- 'full_hex',
-- 'triple_hex',
-- 'rgb',
-- 'rgba',
-- 'hsl',
-- 'hsla',
-- 'colour_names'


-- Filetype specific patterns to match
-- entry value must be comma seperated list
-- vim.g.Hexokinase_ftOptInPatterns = {
--      css = 'full_hex,rgb,rgba,hsl,hsla,colour_names',
--      html = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
--  }

-- " Sample value, to keep default behaviour don't define this variable
vim.g.Hexokinase_ftEnabled = {'css', 'html', 'javascript'}

