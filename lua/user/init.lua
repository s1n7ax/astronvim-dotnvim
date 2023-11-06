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
			'jdtls',
		},

		formatting = {
			format_on_save = true,
		},
	},
}
