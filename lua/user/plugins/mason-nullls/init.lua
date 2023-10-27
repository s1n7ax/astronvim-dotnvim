return {
	'jay-babu/mason-null-ls.nvim',
	opts = function(_, opts)
		opts.ensure_installed = { 'stylua', 'prettierd', 'nixpkgs_fmt' }
		opts.automatic_installation = true

		return opts
	end,
}
