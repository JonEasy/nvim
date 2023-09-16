return {
	{ "catppuccin/nvim", name = "catppuccin", 
	priority = 1000,
	config= function()
		local colorscheme = "catppuccin-macchiato"
		vim.cmd.colorscheme = colorscheme 
		vim.notify("Loading" .. colorscheme)
	end,

	},		

}

