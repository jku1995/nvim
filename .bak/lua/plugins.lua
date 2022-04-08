-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

  -- Simple plugins can be specified as strings
  use '9mm/vim-closer'

  -- color theme
  use "EdenEast/nightfox.nvim" -- Packer

  use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

  -- lsp server manager
  use "williamboman/nvim-lsp-installer"

  --补全插件
  use 'hrsh7th/nvim-cmp'
  ----补全来源 neovim 内置lsp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  ----补全来源 缓冲区
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' }
  ----补全来源 cmdline
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  ----补全路径
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  --snippet 代码片段
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use'hrsh7th/vim-vsnip'
  --包含大部分常用语言的代码片段
  use 'rafamadriz/friendly-snippets'
  --在代码提示的列中,为不同类别的文件提供图标支持
  use 'onsails/lspkind-nvim'
  
 end)


