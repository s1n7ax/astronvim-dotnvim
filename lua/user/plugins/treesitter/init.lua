return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = ",n",
        node_incremental = ",n",
        scope_incremental = ",s",
        node_decremental = ",e",
      },
    },

    text_object           = {
      select = {
        keymaps = {
          ["kk"] = { query = "@block.inner", desc = "inside block" },
          ["kc"] = { query = "@class.inner", desc = "inside class" },
          ["k?"] = { query = "@conditional.inner", desc = "inside conditional" },
          ["kf"] = { query = "@function.inner", desc = "inside function " },
          ["kl"] = { query = "@loop.inner", desc = "inside loop" },
          ["ka"] = { query = "@parameter.inner", desc = "inside argument" },
        },
      }
    }
  }
}
