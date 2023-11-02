return {
	'jay-babu/mason-null-ls.nvim',
	opts = function(_, opts)
		opts.ensure_installed = { 'prettierd' }

		return opts
	end,
}
