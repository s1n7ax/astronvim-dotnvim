vim.cmd.messages('clear')
vim.opt.cmdheight = 5

local function set_timeout(timeout)
	local timer = vim.loop.new_timer()
	local co = coroutine.running()

	assert(timer)

	timer:start(timeout, 0, function()
		coroutine.resume(co)
	end)

	coroutine.yield()
end

local async = function(callback)
	local co = nil
	local error_handler = nil

	co = coroutine.create(function()
		local ok, result = pcall(callback)

		vim.print('>>>>', error_handler)
		if not ok and error_handler then
			error_handler(result)
		end
	end)

	coroutine.resume(co)

	return {
		catch = function(_error_handler)
			error_handler = _error_handler
		end,
	}
end

async(function()
	vim.print('1')
	set_timeout(2000)
	vim.print('2')
end).catch(function(err)
	vim.print('error ', err)
end)
