-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

----------
--基础----
----------
--vim中文手册
use 'yianwillis/vimcdoc'
--Packer包管理器
use 'wbthomason/packer.nvim'
--主题
use { 'rose-pine/neovim',
      config = "vim.cmd('colorscheme rose-pine')",
    }

use {
      'tamton-aquib/staline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      event = "BufRead",
      config = "require('staline-config')"
    }
--当运行TSUpdate才加载
use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
      event = "BufWinEnter",
      config = "require('treesitter-config')"
    }
--bufferline
use {'akinsho/bufferline.nvim',
      tag = "v2.*",
      event = "BufWinEnter",
      requires = 'kyazdani42/nvim-web-devicons',
      config = "require('bufferline-config')"
    }
--nvim-tree
use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icon
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
--which key--
use { 'folke/which-key.nvim',
       config = "require('whichkey-config')"
     }
--telescope.nvim 望远镜
use {
'nvim-telescope/telescope.nvim',
requires = { {'nvim-lua/plenary.nvim'} }
}
-----------
----cmp----
-----------
use {
    "williamboman/nvim-lsp-installer",
    {
        "neovim/nvim-lspconfig",
        config = "require('lsp-config')"
    }
}
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
-- For luasnip users.
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
end)
