local M = {}
local overrides = require "custom.plugins.overrides"
M = {
  -- We are just modifying lspconfig's packer definition table
  ["goolord/alpha-nvim"] = {
    disable = false,
    --cmd = "Alpha",
    override_options = overrides.alpha,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["nvim-tree/nvim-tree.lua"] = { override_options = overrides.nvim_tree },
  ["nvim-treesitter/nvim-treesitter"] = { override_options = overrides.treesitter },
}
return M
