local colorscheme = "base16-espresso"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.notify("Loading" .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end



