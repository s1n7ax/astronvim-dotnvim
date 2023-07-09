return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, neotree_conf)
    neotree_conf.window.mappings.e = 'none'
    return neotree_conf
  end,
}
