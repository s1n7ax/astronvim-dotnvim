local co = coroutine

local wrap = function(func)
	assert(type(func) == 'function', 'type error :: expected func')
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

local function async(func)
	local error_handler = nil

	local async_thunk_factory = wrap(function(handler, parent_handler_callback)
		assert(type(handler) == 'function', 'type error :: expected func')
		local thread = co.create(handler)
		local step = nil

		step = function(...)
			local ok, thunk = co.resume(thread, ...)

			-- when an error() is thrown after co-routine is resumed, obviously further
			-- processing stops, and resume returns ok(false) and thunk(error) returns
			-- the error message
			if not ok then
				if error_handler then
					error_handler(thunk)
					return
				end

				if parent_handler_callback then
					parent_handler_callback(thunk)
					return
				end

				error('unhandled error ' .. thunk)
			end

			assert(ok, thunk)
			if co.status(thread) == 'dead' then
				if parent_handler_callback then
					parent_handler_callback(thunk)
				end
			else
				thunk(step)
			end
		end

		step()
	end)

	return setmetatable({}, {
		__call = function(_, ...)
			return async_thunk_factory(func)(...)
		end,
		__index = function(this, key)
			return function(_error_handler)
				error_handler = _error_handler
				return this
			end
		end,
	})
end

-- many thunks -> single thunk
local join = function(thunks)
	local len = #thunks
	local done = 0
	local acc = {}

	local thunk = function(step)
		if len == 0 then
			return step()
		end
		for i, tk in ipairs(thunks) do
			assert(type(tk) == 'function', 'thunk must be function')
			local callback = function(...)
				acc[i] = { ... }
				done = done + 1
				if done == len then
					step(unpack(acc))
				end
			end
			tk(callback)
		end
	end
	return thunk
end

local await = function(defer)
	return co.yield(defer)
end

local await_handle_error = function(defer)
	local err, value = co.yield(defer)

	if err then
		error(err)
	end

	return value
end

local await_all = function(defer)
	assert(type(defer) == 'table', 'type error :: expected table')
	return co.yield(join(defer))
end

local M = {
	sync = async,
	wait_handle_error = await_handle_error,
	wait = await,
	wait_all = await_all,
	wrap = wrap,
}

local function lsp_request(callback)
	local timer = vim.loop.new_timer()

	assert(timer)

	timer:start(2000, 0, function()
		callback('something went worng', nil)
	end)
end

vim.cmd.messages('clear')

local nested = M.sync(function()
	print('2')
	local response = M.wait_handle_error(M.wrap(lsp_request)())
	print('res ', response)
	print('3')
end)

M.sync(function()
	print('1')
	M.wait_handle_error(nested)
	print('4')
end)()
