local status_ok,wk = pcall(require,"which-key")
if not status_ok then
  vim.notify("which-key load fail")
end
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

local mappings ={
  q={":q<CR>","Quit"},
  w={":w<CR>","Save"},
  E={":e $MYVIMRC<CR>","Edit config"}
}

local opts = {
 prefix = "<leader>",
}

wk.register(mappings, opts)
