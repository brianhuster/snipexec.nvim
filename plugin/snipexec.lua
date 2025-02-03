vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'lua', 'vim', 'python', 'ruby', 'perl' },
	callback = function()
		local map = vim.keymap.set
		map({ 'n', 'x' }, '<Plug>SnipExec', function() require('snipexec').exe() end, { expr = true, buffer = true })
		map({ 'n', 'x' }, 'g=', '<Plug>SnipExec',
			{ buffer = true, desc = "Execute a code snippet the motion moves over or being visually selected" })
		map('n', 'g==', '<Plug>SnipExec_', { buffer = true, desc = "Execute the current line" })
	end
})
