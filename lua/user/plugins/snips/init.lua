local plugin_path = '~/Workspace/nvim-snips'

local M = {
	's1n7ax/nvim-snips',
	name = 'snips',
	dir = plugin_path,
}

if vim.fn.isdirectory(plugin_path) == 1 then
	M.dev = true
	M.dir = plugin_path
end

return M
