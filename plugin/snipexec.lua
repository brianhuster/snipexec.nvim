if vim.g.loaded_snipexec then
	return
end
vim.g.loaded_snipexec = true

local map = vim.keymap.set

map({ 'n', 'x' }, '<Plug>SnipExec', "v:lua.require'snipexec'.opfunc('v')", { expr = true  })

vim.api.nvim_create_autocmd('FileType', {
	pattern = require('snipexec.config')._config.filetypes,
	callback = function()
		local keymap = require('snipexec.config')._config.keymap
		map({ 'n', 'x' }, keymap, '<Plug>SnipExec',
			{ buffer = true, desc = "Execute a code snippet selected by visual mode or motion" })
		map('n', keymap .. keymap:sub(-1), '<Plug>SnipExec_', { buffer = true, desc = "Execute the current line" })
	end
})
