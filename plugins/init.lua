local M = {}
M = {
  -- We are just modifying lspconfig's packer definition table
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
   },
  ["kyazdani42/nvim-tree.lua"] = require("custom.plugins.override.nvim-tree")
}
return M
