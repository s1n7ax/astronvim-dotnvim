return {
  'echasnovski/mini.move',
  event = 'VeryLazy',
  config = function()
    require('mini.move').setup({
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<c-m>',
        right = '<c-i>',
        down = '<c-n>',
        up = '<c-e>',

        -- Move current line in Normal mode
        line_left = nil,
        line_right = nil,
        line_down = nil,
        line_up = nil,
      },
    })
  end,
}
