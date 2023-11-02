local file = require('user.utils.file')

return {
	's1n7ax/nvim-java',
	event = 'VeryLazy',
	dir = file.is_pkg_dir('~/Workspace/nvim-java'),
}
