local M = {
	's1n7ax/nvim-window-picker',
	opts = function(_, opts)
		return opts
	end,
}

local plugin_path = '~/Workspace/nvim-window-picker'

if vim.fn.isdirectory(plugin_path) == 1 then
	M.dev = true
	M.dir = plugin_path
end

return M
