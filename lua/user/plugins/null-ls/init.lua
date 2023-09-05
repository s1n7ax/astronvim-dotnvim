return {
	'jose-elias-alvarez/null-ls.nvim',
	opts = function()
		local n = require('null-ls')

		return {
			sources = {
				n.builtins.formatting.stylua,
			},
		}
	end,
}
