local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	print("Returning.Not importing lspconfig")
	return
end

lspconfig["sumneko_lua"].setup({

	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
	on_attach = require("jpv.lsp.handlers").on_attach,
	capabilities = require("jpv.lsp.handlers").capabilities,
})

-- lspconfig["javascript"].setup({
-- 	-- on_attach = on_attach,
-- 	on_attach = require("jpv.lsp.handlers").on_attach,
-- 	capabilities = require("jpv.lsp.handlers").capabilities,
-- })

lspconfig["tsserver"].setup({
	-- on_attach = on_attach,
	on_attach = require("jpv.lsp.handlers").on_attach,
	capabilities = require("jpv.lsp.handlers").capabilities,
})

lspconfig["kotlin_language_server"].setup({
	-- on_attach = on_attach,
	on_attach = require("jpv.lsp.handlers").on_attach,
	capabilities = require("jpv.lsp.handlers").capabilities,
})
lspconfig["jdtls"].setup({
	on_attach = require("jpv.lsp.handlers").on_attach,
	capabilities = require("jpv.lsp.handlers").capabilities,
})

lspconfig["pyright"].setup({
	-- on_attach = on_attach,
	on_attach = require("jpv.lsp.handlers").on_attach,
	capabilities = require("jpv.lsp.handlers").capabilities,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

-- lspconfig.on_server_ready(function(server)
-- 	print("Server is".. server)
--   local opts = {
--     on_attach = require("jpv.lsp.handlers").on_attach,
--     capabilities = require("jpv.lsp.handlers").capabilities,
--   }
--   end
-- )

--   -- This setup() function is exactly the same as lspconfig's setup function
--   -- Refer to http://github.com/neovim/nvim-lsp-config/blob/master/doc/server_configuration.md
--   server:setup(opts)
--   print("Server setup")
-- end)
