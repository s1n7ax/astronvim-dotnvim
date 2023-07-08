local wk = require('which-key')

wk.register({
  name = 'Windows',

  -- jump to windows
  ['<c-m>'] = { '<c-w>h', 'Jump to left window' },
  ['<c-i>'] = { '<c-w>l', 'Jump to right window' },
  ['<c-n>'] = { '<c-w>j', 'Jump to below window' },
  ['<c-e>'] = { '<c-w>k', 'Jump to above window' },
})
