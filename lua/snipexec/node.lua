---@WIP

local NodeSystemObj = nil

local M = {}

function M.exec(code)
	if not NodeSystemObj then
		NodeSystemObj = vim.system({ 'node', require'snipexec.utils'.get_plugin_path() .. '/javascript/snipexec.js' }, {
			text = true,
			stdin = true,
			stdout = function(_, out)
				if out then print(out) end
			end,
			stderr = vim.schedule_wrap(function(err, _)
				if err then vim.notify(err, vim.log.levels.ERROR) end
			end)
		}, function(obj)
			print(obj.stdout)
			print(obj.stderr)
		end)
	end

	NodeSystemObj:write(code)
	NodeSystemObj:write('\n')
end

return M
