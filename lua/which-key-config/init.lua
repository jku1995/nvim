local status_ok,wk = pcall(require,"which-key")
if not status_ok then
  vim.notify("which-key load fail")
end
wk.setup {
    ignore_missing = true,
    plugins = {
      marks = false, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = false, -- bindings for prefixed with g
      },
    },
    layout = {
        height = { min = 1, max = 25 },
        width = { min = 1, max = 100 },
        spacing = 3,
        align = "center",
    },
    window = {
        border = "double",
        position = "bottom",
        margin = { 0, 0, 0, 0 },
        padding = { 0, 0, 0, 0 },
    },
}


-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1
local nmappings ={
  name="NORMAL",
  q={":q<CR>","Quit"},
  w={":w<CR>","Save"},
  e={":NvimTreeToggle<cr>","Tree"},
  E={":e $MYVIMRC<CR>","Edit config"},
  f={":lua require('telescope.builtin').find_files()<cr>","Find files"},
  g={":lua require('telescope.builtin').live_grep()<cr>","Live grep"},
  b={":lua require('telescope.builtin').buffers()<cr>","List buffers"},
  h={":lua require('telescope.builtin').help_tags()<cr>","Help"},
  t={":<c-u>Translate ZH -source=EN -output=floating<cr>","EN-ZH"},
  r={":<c-u>Translate EN -source=ZH -output=floating<cr>","ZH-EN"}
}
local nopts = {
 prefix = "<leader>",
 }
local xmappings={
  t={":Translate ZH -source=EN -output=floating<cr>","EN-ZH"},
  r={":Translate EN -source=ZH -output=floating<cr>","ZH-EN"}
}
local xopts = {
  mode="x",
  prefix = "<leader>",
}
wk.register(nmappings,nopts)
wk.register(xmappings,xopts)
--wk.register({
--  ["<C-t>"] = {
--      ":Telescope live_grep<cr>",
--      "live_grep"
--  }
--})

