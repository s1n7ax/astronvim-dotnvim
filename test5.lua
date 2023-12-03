vim.cmd.messages('clear')
vim.opt.cmdheight = 5

local function set_timeout(timeout, callback)
	local timer = vim.loop.new_timer()
	assert(timer)
	timer:start(timeout, 0, callback)
end

local function await(func)
	local factory = function(...)
		local params = { ... }
		local thunk = function(step)
			table.insert(params, step)
			return func(unpack(params))
		end
		return thunk
	end
	return factory
end
