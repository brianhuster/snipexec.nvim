local M = {}

M._config = {
	keymap = 'g=',
	filetypes = {'lua', 'vim', 'python', 'ruby', 'perl'},
}

function M.set(opts)
	M._config = vim.tbl_deep_extend('force', M._config, opts or {})
end

return M
