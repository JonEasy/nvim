-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	print("Returning. Plugin saga not present")
	return
end
saga.setup({
	preview = {
		lines_above = 0,
		lines_below = 10,
	},

	code_action = {
		num_shortcut = true,
		keys = {
			quit = "q",
			exec = "<CR>",
		},
	},

	scroll_preview = {
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	request_timeout = 2000,

	lightbulb = {
		enable = false,
		enable_in_insert = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},

	rename = {
		quit = "q",
		exec = "<CR>",
		in_select = false,
	},

	finder = {
		edit = { "o", "<CR>" },
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = { "q", "<ESC>" },
	},

	diagnostic = {
		twice_into = false,
		show_code_action = true,
		show_source = true,
		keys = {
			exec_action = "o",
			quit = "q",
		},
	},

	symbol_in_winbar = {
		enable = false,
		separator = "  ",
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
	},

	definition = {
		edit = "<C-c>o",
		vsplit = "<C-c>v",
		split = "<C-c>i",
		tabe = "<C-c>t",
		quit = "q",
		close = "<Esc>",
	},

	ui = {
		title = false,
		theme = "round",
		border = "rounded",
		winblend = 0,
		expand = "",
		collaspe = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal bakcground color
			normal_bg = "NONE",
			--title background color
			title_bg = "#AAAAAA",
			red = "#db4b4b",
			magenta = "#BB9AF7",
			orange = "#D19A66",
			yellow = "#ECBE7B",
			green = "#98be65",
			cyan = "#7dcfff",
			blue = "#7AA2F7",
			purple = "#a9a1e1",
			white = "#bbc2cf",
			black = "#1a1b26",
		},
		kind = {},
	},

	outline = {
		win_position = "right",
		win_with = "",
		win_width = 30,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = "o",
			expand_collaspe = "u",
			quit = "q",
		},
	},

	callhierarchy = {
		show_detail = false,
		keys = {
			edit = "e",
			vsplit = "s",
			split = "i",
			tabe = "t",
			jump = "o",
			quit = "q",
			expand_collaspe = "u",
		},
	},
})

-- saga.setup({
-- 	use_saga_diagnostic_sign = true,
-- 	error_sign = "",
-- 	warn_sign = "",
-- 	hint_sign = "",
-- 	infor_sign = "",
-- 	diagnostic_header_icon = "   ",
-- 	finder_definition_icon = "  ",
-- 	finder_reference_icon = "  ",
-- 	code_action_prompt = {
-- 		enable = true,
-- 		virutal_text = false,
-- 	},
-- 	border_style = "minimal",
-- })
