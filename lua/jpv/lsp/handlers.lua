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

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 60,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
    print("RETURNING due to not having illuminate")
		return
	end
	illuminate.on_attach(client)
	-- end
end

-- local function lsp_keymaps(bufnr)
-- 	local opts = { noremap = true, silent = true }
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(
-- 		bufnr,
-- 		"n",
-- 		"gl",
-- 		'<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
-- 		opts
-- 	)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- 	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
--   print("Inside keymaps iiiiiiiiiiiiiiiiiiiiiii")
-- end
local function lsp_keymaps()
  print("Inside keymap function")
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
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
    bufmap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>") -- see outline on right hand side
    -- bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    -- bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    -- bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    -- bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    -- bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    -- bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    -- bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    -- bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    -- bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    -- bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    -- bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    -- bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    -- bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    print("Inside keymaps iiiiiiiiiiiiiiiiiiiiiii")

end


M.on_attach = function(client, bufnr)
	lsp_keymaps()
  print("Attaching keymaps")
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()


M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
