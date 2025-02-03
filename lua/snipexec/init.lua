local M = {}

---@param line string
---@return boolean
local function is_empty_line(line)
	return not not line:match('^%s*$')
end

---@param code string
---@return string
local function indent_python(code)
	local indent_char ---@type string|false?
	local redundant_indents_nr = math.huge ---@type number
	local lines = vim.split(code, '\n')

	--- Count the number of indents to remove
	for _, line in ipairs(lines) do
		print(line)
		if not is_empty_line(line) then
			if not indent_char then
				local first_char = line:sub(1, 1)
				indent_char = (first_char == ' ' or first_char == '\t') and first_char
				if not indent_char then
					return code
				end
			end
			local indents = line:match(string.format(
				'^%s*',
				indent_char
			))
			local indents_nr = indents and #indents or 0
			if indents_nr < redundant_indents_nr then
				redundant_indents_nr = indents_nr
			end
		end
	end

	lines = vim.tbl_map(function(line)
		return line:sub(redundant_indents_nr + 1)
	end, lines)

	return table.concat(lines, '\n')
end


function M.opfunc(...)
	local args = { ... }
	if #args == 0 then
		return
	end
	local wise = args[1]
	local restored = {
		sel = vim.o.selection,
		cb = vim.o.clipboard,
		reg = vim.fn.getreg('"'),
	}

	local ft = vim.bo.filetype

	local ok, err = pcall(function()
		vim.o.selection = "inclusive"
		vim.o.clipboard = nil

		local visual_mode_key = { line = 'V', block = [[\<C-V>]] }
		vim.cmd("silent norm! `[" .. (visual_mode_key[wise] or 'v') .. "`]y")
		vim.cmd.redraw()
		local expr = vim.fn.getreg('"')
		expr = ft == 'python' and indent_python(expr) or expr

		if ft == 'vim' then
			vim.cmd(expr)
		else
			vim.cmd(("%s << EOF\n%s\nEOF"):format(ft, expr))
		end
	end)

	if not ok then
		vim.notify(err, vim.log.levels.ERROR)
	end

	vim.o.selection = restored.sel
	vim.o.clipboard = restored.cb
	vim.fn.setreg('"', restored.reg)
end

return M
