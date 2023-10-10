return {
	'jose-elias-alvarez/null-ls.nvim',
	opts = function(_, opts)
		local n = require('null-ls')

		return vim.tbl_deep_extend('force', opts, {
			sources = {
				n.builtins.formatting.stylua,
				n.builtins.formatting.prettierd.with({
					disabled_filetypes = { 'json' },
				}),
			},
		})
	end,
}
