require('java').setup()

return {
	jdtls = function(_, config)
		require('lspconfig').jdtls.setup(config)
	end,
}
