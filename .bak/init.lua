require('plugins')
require('lsp.setup')
require('plugin-config.nvim-tree')
require('lsp.nvim-cmp')
-- 设置行号
vim.wo.number=true
----改变行号的列宽
vim.wo.numberwidth = 4

--设置字体(启用图标需要有nerdFont)
vim.api.nvim_exec([[set guifont=JetBrainsMono\ NF:h14]], false)

-- 设置是否自动换行
--vim.wo.nowrap=true
vim.opt.wrap=true

--https://blog.popon.top/vim-shiftround.html
vim.opt.shiftround=true

--控制字符匹配,通过在字符上按住%
vim.opt.matchpairs='(:),{:},[:]'
--控制显示配对括号的时间(默认是5,0.5s)
vim.opt.matchtime=5

--主题
vim.cmd("colorscheme nightfox")
--映射
----大写S保存
vim.api.nvim_set_keymap('n','S',':w<CR>',{noremap=true,silent=true})
----大写Q退出
vim.api.nvim_set_keymap('n','Q',':q<CR>',{noremap=true,silent=true})
----大写R重新载
vim.api.nvim_set_keymap('n','R',':luafile $MYVIMRC<CR>',{noremap=true,silent=true})
-- s+方向进行分屏
vim.api.nvim_set_keymap('n','sl',':set splitright<CR>:vsplit<CR>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','sh',':set nosplitright<CR>:vsplit<CR>:set splitright<CR>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','sj',':set splitbelow<CR>:split<CR>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','sk',':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>',{noremap=true,silent=true})
--leader
vim.g.mapleader=' ';
----leader 窗口导航
vim.api.nvim_set_keymap('n','<leader>j','<C-W>j',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>k','<C-W>k',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>h','<C-W>h',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>l','<C-W>l',{noremap=true,silent=true})
--leader c leader v复制粘贴
vim.api.nvim_set_keymap('n','<leader>c','"+y<CR>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>v','"+p<CR>',{noremap=true,silent=true})

