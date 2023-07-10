local languages = {
  'lua',
  'javascript',
  'javascriptreact',
  'yaml',
  'java',
  'rust',
  'bash'
}

return {
  "L3MON4D3/LuaSnip",
  dependencies = { 's1n7ax/nvim-snips', 'nvim-treesitter/nvim-treesitter', 's1n7ax/nvim-ts-utils' },
  opts = function()
    local helper = require('user.plugins.luasnip.helper')


    -- Registering snippets
    for _, language in pairs(languages) do
      require(string.format('user.plugins.luasnip.snippets.%s', language)).setup()
    end

    helper.register_keymaps()
  end
}
