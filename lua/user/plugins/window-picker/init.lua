local file = require('user.utils.file')

return {
	's1n7ax/nvim-window-picker',
	dir = file.is_pkg_dir('~/Workspace/nvim-window-picker'),
	opts = function(_, opts)
		return opts
	end,
}
