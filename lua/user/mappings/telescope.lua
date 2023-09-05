local wk = require('which-key')

wk.register({
	name = 'Telescope',
	[',,'] = {
		'<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files<cr>',
		'Find Files',
	},
})
