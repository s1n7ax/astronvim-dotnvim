return {
	colorscheme = 'everforest',
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
			'teal_ls',
		},

		formatting = {
			format_on_save = true,
		},
	},
}
