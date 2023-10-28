local M = {}

local setup_handlers = {
	-- jdtls = function(_, opts)
	-- 	vim.api.nvim_create_autocmd('Filetype', {
	-- 		pattern = 'java',
	-- 		callback = function()
	-- 			local config =
	-- 				vim.tbl_extend('force', opts, M.generate_config())
	--
	-- 			if config.root_dir and config.root_dir ~= '' then
	-- 				require('jdtls').start_or_attach(config)
	-- 			end
	-- 		end,
	-- 	})
	-- end,
}

function M.get_pkg_path(pkg_name)
	return require('mason-registry').get_package(pkg_name):get_install_path()
end

function M.is_pkg_installed(pkg_name)
	return require('mason-registry').get_package(pkg_name):is_installed()
end

function M.get_os()
	if vim.fn.has('mac') == 1 then
		return 'mac'
	elseif vim.fn.has('win32') == 1 or vim.fn.has('win64') then
		return 'win'
	else
		return 'linux'
	end
end

function M.get_file_list(path)
	local files = vim.fn.glob(path, true)

	if files == '' then
		return {}
	end

	return vim.split(files, '\n')
end

function M.get_workspace_dir()
	local cwd_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

	local workspace_dir = vim.fn.stdpath('data')
		.. '/site/java/workspace-root/'
		.. cwd_name

	if vim.fn.isdirectory(workspace_dir) == 0 then
		vim.fn.mkdir(workspace_dir, 'p')
	end

	return workspace_dir
end

function M.get_project_root()
	return require('jdtls.setup').find_root({
		'.git',
		'mvnw',
		'gradlew',
		'pom.xml',
		'build.gradle',
	})
end

function M.generate_config()
	local jdtls_path = M.get_pkg_path('jdtls')
	local os = M.get_os()
	local workspace_dir = M.get_workspace_dir()
	local project_root = M.get_project_root()

	local plugins = {}

	if M.is_pkg_installed('java-test') then
		local path = M.get_pkg_path('java-test')

		vim.list_extend(
			plugins,
			M.get_file_list(path .. '/extension/server/*.jar')
		)
	end

	if M.is_pkg_installed('java-debug-adapter') then
		local path = M.get_pkg_path('java-debug-adapter')

		vim.list_extend(
			plugins,
			M.get_file_list(path .. '/extension/server/*.jar')
		)
	end

	local config = {
		cmd = {
			'java',
			'-Declipse.application=org.eclipse.jdt.ls.core.id1',
			'-Dosgi.bundles.defaultStartLevel=4',
			'-Declipse.product=org.eclipse.jdt.ls.core.product',
			'-Dlog.protocol=true',
			'-Dlog.level=ALL',
			'-javaagent:' .. jdtls_path .. '/lombok.jar',
			'-Xms1g',
			'--add-modules=ALL-SYSTEM',
			'--add-opens',
			'java.base/java.util=ALL-UNNAMED',
			'--add-opens',
			'java.base/java.lang=ALL-UNNAMED',
			'-jar',
			vim.fn.glob(
				jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'
			),
			'-configuration',
			jdtls_path .. '/config_' .. os,
			'-data',
			workspace_dir,
		},

		init_options = {
			bundles = plugins,
		},

		root_dir = project_root,
	}

	return config
end

return setup_handlers
