return {
	colorscheme = 'rose-pine-main',
	lazy = {
		change_detection = {
			notify = false,
		},
		concurrency = 5,
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
