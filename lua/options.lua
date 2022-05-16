local options = {
  -- :help options
  backup = false                         , -- creates a backup file
  clipboard = "unnamedplus"              , -- allows neovim to access the system clipboard
  cmdheight = 2                          , -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0                       , -- so that `` is visible in markdown files
  fileencoding = "utf-8"                 , -- 以utf-8编码写入文件
  hlsearch = false                       , -- 高亮被搜索匹配的字符
  ignorecase = true                      , -- ignore case in search patterns
  mouse = "a"                            , -- allow the mouse to be used in neovim
  pumheight = 10                         , -- 浮动菜单高度
  showmode = false                       , -- 是否在底部显示vim的编辑模式，像--VIUSAL--,--INSERT--
  showtabline = 2                        , -- always show tabs
  smartcase = true                       , -- smart case
  smartindent = true                     , -- 智能缩进
  splitbelow = true                      , -- 强制水平split在当前窗口下产生新窗口
  splitright = true                      , -- 强制垂直split在当前窗口右侧产生新窗口
  swapfile = false                       , -- creates a swapfile
  termguicolors = true        ,            -- 设置term gui支持256色 (most terminals support this)
  timeoutlen = 1000                      , -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true                        , -- enable persistent undo
  updatetime = 300                       , -- faster completion (4000ms default)
  writebackup = false                    , -- 如果文件被其他程序占用，则不允许编辑if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true											 , -- convert tabs to spaces
  shiftwidth = 2                         , -- 为每个缩进插入的空格数
  tabstop = 2                            , -- 每个tab两个空格
  cursorline = true                      , -- 当前行高亮
  number = true                          , -- set numbered lines
  relativenumber = false                 , -- set relative numbered lines
  numberwidth = 4                        , -- set number column width to 2 {default 4}
  signcolumn = "yes"                     , -- always show the sign column, otherwise it would shift the text each time
  wrap = false                           , -- display lines as one long line
  scrolloff = 8                          , -- 光标上下8行时触发滚动
  sidescrolloff = 8			                 ,
  --guifont ="FiraCode NF:h17"             , -- the font used in graphical neovim applications
  fileformats ="unix,dos"                , -- 移除windows使用format在尾部生成^M的行为
  whichwrap="b,s,<,>,[,],h,l"            , --设置匹配包含符号，使用%可以在包含符号间切换
  hidden=true                            , --是否允许隐藏一个未保存的buffer
  autoindent=true                        , --自动缩进,通常打开smartindent也应打开autoindent
  timeoutlen=200
}
for k, v in pairs(options) do
  vim.opt[k] = v
end
--短的提示信息
vim.opt.shortmess:append "c"
vim.cmd [[set iskeyword+=-]]                    --word connect with '-' will be recognized one word 
vim.cmd [[set formatoptions-=cro]]              -- TODO: this doesn't seem to work
