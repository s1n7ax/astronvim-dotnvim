local ls = require('luasnip')
local wk = require('which-key')

local M = {}

function M.register_keymaps()
	wk.register({
		['<c-i>'] = { M.expand_or_jump('<c-i>'), '(Snippet) Expand or jump' },
		['<c-m>'] = { M.jump_prev('<c-n>'), '(Snippet) Jump prev placeholder' },
		['<c-l>'] = { M.change_choice('<c-l>'), '(Snippet) Change choice' },
	}, { mode = { 'i', 's' } })

	wk.register({
		['<leader><leader>t'] = { M.refresh_snippets, '(Snippet) refresh' },
	})
end

function M.expand_or_jump(fallback_key)
	return function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.jump_next(fallback_key)
	return function()
		if ls.jumpable(1) then
			ls.jump(1)
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.jump_prev(fallback_key)
	return function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.change_choice(fallback_key)
	return function()
		if ls.choice_active() then
			ls.change_choice(1)
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.refresh_snips()
	print('Refreshing lua snips')

	local module_utils = require('user.utils.module')

	module_utils.unload_package('ts-utils')
	module_utils.unload_package('snips')
	module_utils.unload_package('nvim.plugins.luasnip')

	ls.cleanup()

	M.register_snippets()

	-- just of testing snips
	module_utils.unload_package('user.plugins.luasnip.demo')
	require('nvim.plugins.luasnip.demo')
end

return M
