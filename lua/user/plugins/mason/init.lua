return {
	'williamboman/mason.nvim',
	opts = function(_, opts)
		opts.registries = {
			'github:nvim-java/nvim-java-mason-registry',
			'github:mason-org/mason-registry',
		}

		return opts
	end,
}
