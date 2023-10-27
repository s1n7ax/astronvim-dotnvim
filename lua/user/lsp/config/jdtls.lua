local utils = require('user.lsp.utils')

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data')
	.. '/site/java/workspace-root/'
	.. project_name
os.execute('mkdir ' .. workspace_dir)

local jdtls_path = utils.get_package_path('jdtls')

-- get the current OS
local os = utils.get_os()

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
	root_dir = root_dir,
}

local bundles = {}

-- Adding java-debug plugins
local java_debug_path = utils.get_package_path('java-debug-adapter')

if vim.fn.isdirectory(java_debug_path) then
	local files = utils.get_file_list(
		java_debug_path
			.. '/extension/server/com.microsoft.java.debug.plugin-*.jar'
	)

	vim.list_extend(bundles, files)
end

-- Adding java-test plugins
local java_test_path = utils.get_package_path('java-test')

if vim.fn.isdirectory(java_test_path) then
	local files =
		utils.get_file_list(java_test_path .. '/extension/server/*.jar')

	vim.list_extend(bundles, files)
end

config.init_options = {
	bundles = bundles,
}

return config
