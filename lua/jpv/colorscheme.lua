local options = {
	-- Compiled file's destination location
	compile_path = vim.fn.stdpath("cache") .. "/nightfox",
	compile_file_suffix = "_compiled", -- Compiled file suffix
	transparent = false, -- Disable setting background
	terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
	dim_inactive = true,
	styles = {
		comments = "italic",
		-- keywords = "bold",
		variables = "italic",
		-- strings = "bold",
		types = "italic,bold",
	},
}

local palettes = {
	nightfox = {
		-- red = "#c94f6d",
		-- red = "#851e31",
		-- green = "#44944b",
		-- -- green = "#328729",
		-- red = "#c94f6d",
		-- yellow = "#f2b53a",
		-- orange = "#E67E22",
		-- white = "#F8F9F9",
	},
	nordfox = {
		comment = "#60728a",
		sel0 = "#3e4a5b",
	},
}
local specs = {
	nightfox = {
		syntax = {
			builtin0 = "orange.bright",
			builtin1 = "magenta.dim",
			ident = "white",
			const = "orange.dim",
			field = "magenta.dim",
			statetement = "black",
			type = "#f3f3f3",
			keyword = "orange",
			string = "green.dim",
		},
		git = {
			changed = "red.dim",
		},
	},
}
local groups = {
	all = {
		-- IncSearch = { bg = "palette.cyan" },
		-- PmenuSel = { bg = "#73daca", fg = "bg0" },
		-- TSField= { bg = "#73daca", fg = "bg0" },
		-- TSFunction = {sp = "pink"},
	},
}

require("nightfox").setup({
	options = options,
	palettes = palettes,
	specs = specs,
	groups = groups,
})
--
-- setup must be called before loading
-- local colorscheme = "gruvbox"
-- local colorscheme = "nightfox"
-- local colorscheme = "nightfly"
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
-- vim.cmd([[

-- let g:jpv_colorscheme = "gruvbox"
-- colorscheme ayu
-- set background=dark
-- let g:gruvbox_contrast_dark = 'hard'
-- if exists('+termguicolors')
--  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
--  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
-- endif

-- let g:gruvbox_invert_selection='0'

-- ]])
