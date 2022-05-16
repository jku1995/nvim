require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',--自动适应主题，如使用的是nord,则lualine自动设置为nord
    --component_separators = { left = '', right = ''},
    component_separators = "",
    --section_separators = { left = '', right = ''},
    section_separators = "",
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    --lualine_x = {'location'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
