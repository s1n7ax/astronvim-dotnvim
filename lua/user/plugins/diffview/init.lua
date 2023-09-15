return {
	'sindrets/diffview.nvim',
	dependencies = 'nvim-lua/plenary.nvim',
	keys = {
		{
			'<leader>hd',
			'<cmd>DiffviewFileHistory %<cr>',
			'Git diff file',
			mode = 'n',
		},
		{
			'<leader>hD',
			'<cmd>DiffviewFileHistory<cr>',
			'Git diff branch',
			mode = 'n',
		},

		{
			'<leader>hd',
			':DiffviewFileHistory<cr>',
			'Git diff selection',
			mode = 'v',
		},
	},
	cmd = {
		'DiffviewOpen',
		'DiffviewFileHistory',
		'DiffviewToggleFiles',
		'DiffviewFocusFiles',
		'DiffviewRefresh',
		'DiffviewLog',
	},
}
