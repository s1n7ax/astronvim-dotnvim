local file = require('user.utils.file')

return {
	'nvim-java/nvim-java',
	dependencies = {
		{
			'nvim-java/nvim-java-core',
			dir = file.is_pkg_dir('~/Workspace/nvim-java-core'),
		},
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'mfussenegger/nvim-dap',
	},
	event = 'VeryLazy',
	dir = file.is_pkg_dir('~/Workspace/nvim-java'),
	opts = {},
}
