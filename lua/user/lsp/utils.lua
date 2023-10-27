local M = {}

function M.get_package_path(package)
	return require('mason-registry').get_package(package):get_install_path()
end

function M.get_file_list(path)
	local files = vim.fn.glob(path, true)

	if files == '' then
		return {}
	end

	return vim.split(files, ',')
end

function M.get_os()
	local os

	if vim.fn.has('macunix') then
		os = 'mac'
	elseif vim.fn.has('win32') then
		os = 'win'
	else
		os = 'linux'
	end

	return os
end

return M
