local function opfunc(t)
	local restored_reg = vim.fn.getreg('"')
	local visual_mode_key = { l = 'V', b = [[\<C-V>]] }
	vim.cmd("silent norm! `[" .. visual_mode_key[t:sub(1, 1)] or 'v' .. "`]y")
	vim.cmd.redraw()
	local selected_text = vim.fn.getreg('"')
	vim.fn.setreg('"', restored_reg)
	return selected_text
end

return function(...)
	local ft = vim.bo.filetype
	local args = { ... }
	if #args == 0 then
		vim.o.opfunc = "v:lua.require'snipexec'"
		return "g@"
	end

	local restored_opts = { vim.o.selection, vim.opt.clipboard }

	local ok, err = pcall(function()
		vim.o.selection = "inclusive"
		vim.opt.clipboard:remove { "unnamed", "unnamedplus" }

		local expr = opfunc(args[1])

		if ft == 'vim' then
			vim.cmd(expr)
		else
			vim.cmd(("%s << EOF\n%s\nEOF"):format(
				ft == 'python' and 'py3' or ft,
				expr
			))
		end
	end)

	if not ok then
		vim.notify(err, vim.log.levels.ERROR)
	end

	vim.o.selection, vim.o.clipboard = unpack(restored_opts)
end
