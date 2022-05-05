require "user.options"
require "user.keymaps"
require "user.plugins"
--vimcmd "colorscheme delek"
--vim.cmd "colorscheme darkplus"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.lsp.telescope"
require "user.treesitter"
require "user.nvim-tree"

--toggleterm
require "user.tool.toggleterm"

--startup
--require "user.tool.alpha" --@deprecated 启动界面暂时不需要，配置保留
