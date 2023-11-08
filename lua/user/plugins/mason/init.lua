return {
	'williamboman/mason.nvim',
	opts = function(_, opts)
		opts.registries = {
			'github:s1n7ax/mason-registry',
			'github:mason-org/mason-registry',
		}

		return opts
	end,
}
