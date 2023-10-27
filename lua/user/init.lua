return {
	colorscheme = 'catppuccin-mocha',
	lazy = {
		change_detection = {
			notify = false,
		},
	},
	lsp = {
		servers = {
			'lua_ls',
			'rust_analyzer',
		},

		formatting = {
			format_on_save = true,
		},
	},
}
