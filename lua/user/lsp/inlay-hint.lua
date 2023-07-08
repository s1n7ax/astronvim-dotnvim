local lsp_util = require('user.utils.lsp.common')

local ignore_list = {}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = lsp_util.get_client(ev)

    -- ignore LS in ignore_list
    for _, ls in ipairs(ignore_list) do
      if client.name == ls then
        return
      end
    end

    vim.print(client.name, client.server_capabilities.inlayHintProvider)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.buf.inlay_hint(0, true)
    end
  end,
})
