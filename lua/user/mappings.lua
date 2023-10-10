require('user.mappings.colemak-remaps')
require('user.mappings.normal')
require('user.mappings.insert')
require('user.mappings.telescope')
require('user.mappings.terminal')
require('user.mappings.command')

return function(maps)
	-- disable window navigation mappings
	maps.n['<C-h>'] = nil
	maps.n['<C-j>'] = nil
	maps.n['<C-k>'] = nil
	maps.n['<C-l>'] = nil

	maps.t['<C-h>'] = nil
	maps.t['<C-j>'] = nil
	maps.t['<C-k>'] = nil
	maps.t['<C-l>'] = nil

	-- disable save & quite keymap
	maps.n['<C-s>'] = nil
	maps.n['<leader>w'] = nil

	maps.n['<C-q>'] = nil
	maps.n['<leader>q'] = nil

	maps.n['<C-s>'] = { '<cmd>update<cr>', desc = 'Save' }
	maps.n['<C-q>'] = { '<cmd>confirm q<cr>', desc = 'Quit' }

	return maps
end
