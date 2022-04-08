local colorscheme = "darkplus"
--arg2 is the value of pcall returning,we dont care,so put _ on it
local status_ok,_=pcall(vim.cmd,"colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

