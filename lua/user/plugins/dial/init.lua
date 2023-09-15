local function inc()
	require('dial.map').manipulate('increment', 'normal')
end

local function dec()
	require('dial.map').manipulate('decrement', 'normal')
end

local function inc_g()
	require('dial.map').manipulate('increment', 'gnormal')
end

local function dec_g()
	require('dial.map').manipulate('decrement', 'gnormal')
end

local function inc_v()
	require('dial.map').manipulate('increment', 'visual')
end

local function dec_v()
	require('dial.map').manipulate('decrement', 'visual')
end

local function inc_gv()
	require('dial.map').manipulate('increment', 'gvisual')
end

local function dec_gv()
	require('dial.map').manipulate('decrement', 'gvisual')
end

return {
	'monaqa/dial.nvim',
	keys = {
		{ '<C-a>', inc, desc = 'Increment', mode = 'n' },
		{ '<c-x>', dec, desc = 'Decrement', mode = 'n' },
		{ 'g<C-a>', inc_g, desc = 'Increment', mode = 'n' },
		{ 'g<C-x>', dec_g, desc = 'Decrement', mode = 'n' },

		{ '<C-a>', inc_v, desc = 'Visual Increment', mode = 'v' },
		{ '<C-x>', dec_v, desc = 'Visual Decrement', mode = 'v' },
		{ 'g<C-a>', inc_gv, desc = 'Visual Increment', mode = 'v' },
		{ 'g<C-x>', dec_gv, desc = 'Visual Decrement', mode = 'v' },
	},
	config = function()
		local augend = require('dial.augend')

		require('dial.config').augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.constant.alias.bool,
				augend.date.alias['%Y/%m/%d'],
				augend.date.alias['%d/%m/%Y'],
			},
		})
	end,
}
