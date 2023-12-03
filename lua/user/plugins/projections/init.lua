return {
	'gnikdroy/projections.nvim',
	event = 'VeryLazy',
	config = function()
		require('projections').setup({
			workspaces = {
				'~/Workspace',
			},
		})

		require('telescope').load_extension('projections')

		vim.keymap.set('n', '<leader>fp', function()
			vim.cmd('Telescope projections')
		end)

		-- Autostore session on VimExit
		local Session = require('projections.session')

		vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
			callback = function()
				Session.store(vim.fn.getcwd(0, 0))
			end,
		})

		-- Switch to project if vim was started in a project dir
		local switcher = require('projections.switcher')

		vim.api.nvim_create_autocmd({ 'VimEnter' }, {
			callback = function()
				if vim.fn.argc() == 0 then
					switcher.switch(vim.fn.getcwd(0, 0))
				end
			end,
		})
	end,
}
