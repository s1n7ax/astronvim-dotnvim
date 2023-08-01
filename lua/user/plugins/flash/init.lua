local flash = function(func_name)
	return function()
		require('flash')[func_name]()
	end
end

local keys = {
	{ 's', mode = { 'n', 'x', 'o' }, flash('jump'), desc = 'Flash' },
	{
		'S',
		mode = { 'n', 'o', 'x' },
		flash('treesitter'),
		desc = 'Flash Treesitter',
	},
	{ 'r', mode = 'o', flash('remote'), desc = 'Remote Flash' },
	{
		'R',
		mode = { 'o', 'x' },
		flash('treesitter_search'),
		desc = 'Treesitter Search',
	},
	{ '<c-s>', mode = { 'c' }, flash('toggle'), desc = 'Toggle Flash Search' },
}

return {
	'folke/flash.nvim',
	event = 'VeryLazy',
	opts = {},
	keys = keys,
}
