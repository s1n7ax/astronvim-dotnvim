local M = {
	's1n7ax/nvim-devcontainer',
	event = 'VeryLazy',
	config = false,
}
local plugin_path = '~/Workspace/nvim-devcontainer'

if vim.fn.isdirectory(plugin_path) == 1 then
	M.dev = true
	M.dir = plugin_path
end

return M
