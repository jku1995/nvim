return {
  ["nvim-tree/nvim-tree"] = {
    overide_options = {
       update_focused_file = {
        enable = true,
        update_root = true,
      },
    },
  },
  -- We are just modifying lspconfig's packer definition table
["neovim/nvim-lspconfig"] = {
    config = function()
--      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
},
}
