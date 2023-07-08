local languages = {
  'lua',
  'javascript',
  'javascriptreact',
  'yaml',
  'java',
  'rust',
}

return {
  "L3MON4D3/LuaSnip",
  dependencies = { 's1n7ax/nvim-snips', 'nvim-treesitter/nvim-treesitter', 's1n7ax/nvim-ts-utils' },
  config = function()
    local ls = require('luasnip')
    local wk = require('which-key')


    -- Registering snippets
    for _, language in pairs(languages) do
      require(string.format('user.plugins.luasnip.snippets.%s', language)).setup()
    end

    local function refresh_snips()
      print('Refreshing lua snips')

      local module_utils = require('user.utils.module')

      module_utils.unload_package('ts-utils')
      module_utils.unload_package('snips')
      module_utils.unload_package('nvim.plugins.luasnip')

      ls.cleanup()

      M.register_snippets()

      -- just of testing snips
      module_utils.unload_package('user.plugins.luasnip.demo')
      require('nvim.plugins.luasnip.demo')
    end

    wk.register({
      t = { refresh_snips, 'Refresh Snips' }
    }, {
      prefix = '<leader><leader>'
    })
  end
}
