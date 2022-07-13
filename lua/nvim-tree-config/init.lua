-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
    auto_reload_on_write = true,--写入自动刷新(默认）
    disable_netrw = true,--是否关闭自带文件管理器
    hijack_netrw = true,--开启nerdtree
    view = {
      width = 25,
      },
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    renderer = {
      icons = {
        glyphs={
          default = "",
          symlink = "",
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
          git={
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
        },
      },
      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
    },
  },
}
--auto_close api因为引发很多bug被移除，此自动方法可替代
vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})

