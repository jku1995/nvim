local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  -- 异常通知
  vim.notify("packer load failed!")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install your plugins here
return packer.startup(function(use)

  -- Chinese Manual
  use "yianwillis/vimcdoc"
  -- My plugins here
  use "wbthomason/packer.nvim"-- Have packer manage itself
  use "nvim-lua/popup.nvim"   -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "rstacruz/vim-closer"        -- Closes brackets
  use 'kyazdani42/nvim-tree.lua' -- nvim tree file explorer

  -- Plugins can have post-install/update hooks
  use({ "iamcco/markdown-preview.nvim",opt=true,run = "cd app && npm install", ft = { "markdown" }})

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use {"hrsh7th/cmp-nvim-lua",opt=true,ft="lua"} --nvim-cmp source for neovim LuaApi
  use "hrsh7th/cmp-nvim-lsp" -- source for lsp

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to uset engine)

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use {"mfussenegger/nvim-jdtls",opt=true,ft="java"} --Neovim build-in Lsp extension for jdtls

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  --tree sitter
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
     }
  use "p00f/nvim-ts-rainbow" --Rainbow parentheses for neovim using tree-sitter. Also at
  --startup
  use {
    'goolord/alpha-nvim',
    config = function ()
        --require 'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
    }
  --translation
  use 'voldikss/vim-translator'

  --toggleterm
  use 'akinsho/toggleterm.nvim'
  --
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
