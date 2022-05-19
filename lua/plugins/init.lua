-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  --vim中文手册
  use 'yianwillis/vimcdoc'
  -- Packer包管理器
  use 'wbthomason/packer.nvim'
  -- Nord主题
  use 'shaunsingh/nord.nvim'
  --当运行TSUpdate才加载
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  --lualine 底部增加一个状态栏 
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  --bufferline
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  --nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  --which key--
  use {"folke/which-key.nvim",}

  --telescope.nvim 望远镜
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
--lsp--
use {"williamboman/nvim-lsp-installer",
{
use "neovim/nvim-lspconfig",
config = require("lsp-config")
}
}
-----------
----cmp----
-----------
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'saadparwaiz1/cmp_luasnip'
-- lua写的snippet引擎
use 'L3MON4D3/LuaSnip'
-- 翻译插件
use 'uga-rosa/translate.nvim'
-- 离线词典vimscript编写
--use 'sicong-li/T.vim'
end)
