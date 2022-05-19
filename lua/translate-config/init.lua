--let g:deepl_api_auth_key = 'MY_AUTH_KEY'
require("translate").setup({
    default = {
        command = "google",
        output = "floating",
        parse_after = "no_handle",
        parse_before = "trim",
    },
    preset = {
        output = {
            split = {
                min_size = 8
            }
        }
      }})
local nosl = { noremap = true, silent = true }
--vim.api.nvim_set_keymap("n", "<leader>t", ":<c-u>Translate ZH -source=EN -output=floating<cr>",nosl)
--vim.api.nvim_set_keymap("x", "<leader>t", ":Translate ZH -source=EN -output=floating<cr>",nosl)
--vim.api.nvim_set_keymap("n", "<leader>tr", ":<c-u>Translate EN -source=ZH -output=floating<cr>",nosl)
--vim.api.nvim_set_keymap("x", "<leader>tr", ":Translate EN -source=ZH -output=floating<cr>",nosl)
