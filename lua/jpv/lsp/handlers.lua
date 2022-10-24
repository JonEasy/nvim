local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	print("Returning due to not cmp_nvim_lsp")
	return
end

print("LOOOAADIN")

local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	-- local config = {
	-- 	-- disable virtual text
	-- 	virtual_text = false,
	-- 	-- show signs
	-- 	signs = {
	-- 		active = signs,
	-- 	},
	-- 	update_in_insert = true,
	-- 	underline = true,
	-- 	severity_sort = true,
	-- 	float = {
	-- 		focusable = false,
	-- 		style = "minimal",
	-- 		border = "rounded",
	-- 		source = "always",
	-- 		header = "",
	-- 		prefix = "",
	-- 	},
	-- }

	-- vim.diagnostic.config(config)

	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- 	border = "rounded",
	-- 	width = 60,
	-- })

	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- 	border = "rounded",
	-- 	width = 60,
	-- })
end
local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps()
	local bufmap = function(mode, lhs, rhs)
		local opts = { buffer = true }
		vim.keymap.set(mode, lhs, rhs, opts)
	end
	-- You can search each function in the help page.
	-- For example :help vim.lsp.buf.hover()
	bufmap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
	bufmap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>") -- got to declaration
	bufmap("n", "gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
	bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
	bufmap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions
	bufmap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>") -- smart rename
	bufmap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
	bufmap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
	bufmap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
	bufmap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
	bufmap("n", "K", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
	bufmap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>") -- see outline on rik
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()']])
	print("Inside keymaps iiiiiiiiiiiiiiiiiiiiiii")
end

M.on_attach = function(client, bufnr)
	lsp_keymaps()
	print("Attaching keymaps")
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
