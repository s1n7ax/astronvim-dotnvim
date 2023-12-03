return {
	'stevearc/oil.nvim',
	cmd = { 'Oil' },
	keys = {
		{
			'<leader>io',
			function()
				require('oil').toggle_float(vim.fn.expand('%:h'))
			end,
			desc = 'Open Oil',
		},
	},
	opts = {
		keymaps = {
			['g?'] = 'actions.show_help',
			['<CR>'] = 'actions.select',
			['<C-s>'] = 'actions.select_vsplit',
			['<C-h>'] = 'actions.select_split',
			['<C-t>'] = 'actions.select_tab',
			['<C-p>'] = 'actions.preview',
			['<C-c>'] = 'actions.close',
			['R'] = 'actions.refresh',
			['<bs>'] = 'actions.parent',
			['_'] = 'actions.open_cwd',
			['`'] = 'actions.cd',
			['~'] = 'actions.tcd',
			['gs'] = 'actions.change_sort',
			['gx'] = 'actions.open_external',
			['z'] = 'actions.toggle_hidden',
			['g\\'] = 'actions.toggle_trash',
		},
	},
	dependencies = { 'nvim-tree/nvim-web-devicons' },
}
