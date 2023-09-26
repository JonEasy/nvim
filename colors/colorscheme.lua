local colorscheme = "catppuccin-macchiato"
vim.g.termguicolors = true
-- local colorscheme = "aura"
-- local colorscheme = "base16-espresso"
-- local colorscheme = "ayu"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- vim.g.background = dark
vim.notify("Loading" .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
