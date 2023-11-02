local java = require('java')

return {
	jdtls = function(_, opts)
		local conf = java.get_config()
		conf.on_attach = opts.on_attach

		require('lspconfig').jdtls.setup(conf)
	end,
}
