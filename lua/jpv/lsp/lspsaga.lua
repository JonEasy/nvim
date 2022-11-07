-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	print("Returning. Plugin saga not present")
	return
end
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
saga.init_lsp_saga({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	-- use enter to open file with finder
	finder_action_keys = {
		open = "<CR>",
	},
	-- use enter to open file with definition preview
	definition_action_keys = {
		edit = "<CR>",
	},
})
