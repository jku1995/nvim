require("bufferline").setup {}
--tab下一个
vim.api.nvim_set_keymap("n","<TAB>",":BufferLineCycleNext<CR>",{silent=true,noremap=true})
--shift+tab 上一个
vim.api.nvim_set_keymap("n","<S-TAB>",":BufferLineCyclePrev<CR>",{silent=true,noremap=true})

