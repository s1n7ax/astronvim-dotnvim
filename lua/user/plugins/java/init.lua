local file = require('user.utils.file')

return {
	'nvim-java/nvim-java',
	dependencies = {
		{
			'MunifTanjim/nui.nvim',
			'nvim-neotest/neotest',
			{
				'nvim-java/lua-async-await',
				dir = file.is_pkg_dir('~/Workspace/lua-async-await'),
			},
			dependencies = {
				'nvim-lua/plenary.nvim',
				'antoinemadec/FixCursorHold.nvim',
				{
					'nvim-java/neotest-jdtls',
					dir = file.is_pkg_dir('~/Workspace/neotest-jdtls'),
				},
				'rcasia/neotest-java',
			},
		},
		{
			'nvim-java/nvim-java-test',
			dir = file.is_pkg_dir('~/Workspace/nvim-java-test'),
		},
		{
			'nvim-java/nvim-java-core',
			dir = file.is_pkg_dir('~/Workspace/nvim-java-core'),
		},
		{
			'nvim-java/nvim-java-dap',
			dir = file.is_pkg_dir('~/Workspace/nvim-java-dap'),
		},
		'neovim/nvim-lspconfig',
		{
			'williamboman/mason.nvim',
			opts = {
				registries = {
					'github:nvim-java/mason-registry',
					'github:mason-org/mason-registry',
				},
			},
		},
		'mfussenegger/nvim-dap',
	},
	event = 'VeryLazy',
	dir = file.is_pkg_dir('~/Workspace/nvim-java'),
	opts = {},
}
