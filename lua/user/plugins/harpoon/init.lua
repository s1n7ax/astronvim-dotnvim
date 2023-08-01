return {
	'ThePrimeagen/harpoon',
	event = 'VeryLazy',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = function()
		local wk = require('which-key')
		local hpm = require('harpoon.mark')
		local hpu = require('harpoon.ui')

		local nav = function(index)
			return function()
				hpu.nav_file(index)
			end
		end

		wk.register({
			[',l'] = { hpm.add_file, 'Harpoon Add File' },
			[',L'] = { hpu.toggle_quick_menu, 'Harpoon Toggle Menu' },
			['<c-1>'] = { nav(1), 'Harpoon Jump to 1st' },
			['<c-2>'] = { nav(2), 'Harpoon Jump to 2nd' },
			['<c-3>'] = { nav(3), 'Harpoon Jump to 3rd' },
			['<c-4>'] = { nav(4), 'Harpoon Jump to 4th' },
		})

		return {}
	end,
}
