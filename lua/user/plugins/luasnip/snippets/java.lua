local M = {}

function M.setup()
	local ls = require('luasnip')
	local java = require('snips.java')

	local s = ls.s

	ls.add_snippets('java', {
		s('o', java.primitives.stdout()),
	})
end

return M
