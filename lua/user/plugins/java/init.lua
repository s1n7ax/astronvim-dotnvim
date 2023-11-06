local file = require('user.utils.file')

return {
	's1n7ax/nvim-java',
	dependencies = {
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'mfussenegger/nvim-dap',
	},
	event = 'VeryLazy',
	dir = file.is_pkg_dir('~/Workspace/nvim-java'),
}
