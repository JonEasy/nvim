local cmp_nvim_lsp = require("cmp_nvim_lsp")
local keymap = vim.keymap -- for conciseness

local M = {}
local opts = { noremap = true, silent = true }
M.on_attach = function(client, bufnr)
	opts.buffer = bufnr

	-- set keybinds
	opts.desc = "Show LSP references"
	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

	opts.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

	--opts.desc = "Show LSP definitions"
	--keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

	opts.desc = "Show LSP type definitions"
	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

	opts.desc = "See available code actions"
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

	opts.desc = "Smart rename"
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

	opts.desc = "Show line diagnostics"
	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

	opts.desc = "Show documentation for what is under cursor"
	keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

	opts.desc = "Restart LSP"
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

	opts.desc = "See definitons and make edits in window"
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window

	opts.desc = "See available actions"
	keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts)

	opts.desc = "smart renamej"
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

	opts.desc = "show diagnostics for line"
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

	opts.desc = "show diagnostics for cursos"
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

	opts.desc = "jump tp previous diagnostic in buffer"
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

	opts.desc = "jump to next diagnostic in buffer"
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

	opts.desc = "show documentation for what is under cursor"
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

	opts.desc = "see outline rik"
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>")
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
