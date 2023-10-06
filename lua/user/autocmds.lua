vim.api.nvim_create_autocmd('BufWinEnter', {
	pattern = '*',
	callback = function()
		-- skip if a pop up window
		if vim.fn.win_gettype() == 'popup' then
			return
		end

		-- skip if new buffer
		if vim.bo.filetype == '' then
			return
		end

		vim.wo.winbar = "%{%v:lua.require'user.utils.nvim.winbar'.eval()%}"
	end,
	group = vim.api.nvim_create_augroup('WinBar', {}),
})
