local overseer_heirline = require('user.plugins.overseer.heirline')

return {
	{
		'rebelot/heirline.nvim',
		opts = function(_, opts)
			table.insert(opts.statusline, 5, overseer_heirline)
			opts.winbar = nil
			return opts
		end,
	},
}
