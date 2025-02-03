local M = {}

M.plugin_path = nil

--- Get the path where live-preview.nvim is installed
--- @return string
function M.get_plugin_path()
	if M.plugin_path then
		return M.plugin_path
	end
	local info = debug.getinfo(1, "S")
	local source = info and info.source
	local full_path = source and source:sub(1, 1) == "@" and source:sub(2)
	local subpath = "lua/snipexec/utils.lua"
	local plugin_path = full_path and full_path:sub(1, -1 - #subpath)
	M.plugin_path = plugin_path and vim.fs.normalize(plugin_path)
	return M.plugin_path
end

return M
