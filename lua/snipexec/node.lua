local node_chan = nil

local M = {}

---@param code string
function M.exec(code)
	if not node_chan then
		node_chan = vim.fn.jobstart({ 'node', 'javascript/snipexec.js' }, {
			on_stdout = function(_, data, _)
				print(table.concat(data, "\n"))
			end,
			on_stderr = function(_, data, _)
				vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
			end
		})
	end
	vim.fn.chansend(node_chan, code)
end

Node = M.node

return M
