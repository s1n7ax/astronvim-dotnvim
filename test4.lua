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

---@enum AsyncState
local AsyncState = {
	PENDING = 1,
	ERROR = 2,
}

---@class Async
---@field state AsyncState
---@field value any
---@field error any
local Async = {}

function Async:new()
	local o = {}
	setmetatable(o, self)
	self.__index = self

	self.state = AsyncState.PENDING
	self.result = nil
	self.error = nil

	return o
end

function Async:run(success_handler)
	local new_async = Async:new()

	local wrapper_co

	wrapper_co = coroutine.create(function()
		if self.state == AsyncState.PENDING then
			local ok, result = pcall(success_handler, self.result)

			if ok then
				new_async.result = result
			else
				new_async.state = AsyncState.ERROR
				new_async.error = result
			end
		end
	end)

	coroutine.resume(wrapper_co)

	return new_async
end

function Async:catch(error_handler)
	local new_async = Async:new()

	if self.state == AsyncState.ERROR then
		new_async.state = self.state
		new_async.error = self.error

		error_handler(self.error)
	end

	return new_async
end

Async:new()
	:run(function()
		vim.print('1')
		set_timeout(2000)
	end)
	:run(function()
		vim.print('2')
	end)
	:catch(function(err)
		vim.print('error ', err)
	end)
