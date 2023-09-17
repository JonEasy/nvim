return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local status_ok, lspconfig = pcall(require, "lspconfig")
		if not status_ok then
			print("Returning.Not importing lspconfig")
			return
		end

		lspconfig["lua_ls"].setup({

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
			on_attach = require("jpv.lsp.plugins.handlers").on_attach,
			capabilities = require("jpv.lsp.plugins.handlers").capabilities,
		})

		lspconfig["tsserver"].setup({
			-- on_attach = on_attach,
			on_attach = require("jpv.lsp.plugins.handlers").on_attach,
			capabilities = require("jpv.lsp.plugins.handlers").capabilities,
		})
		lspconfig["dockerls"].setup({
			-- on_attach = on_attach,
			on_attach = require("jpv.lsp.plugins.handlers").on_attach,
			capabilities = require("jpv.lsp.plugins.handlers").capabilities,
		})

		lspconfig["kotlin_language_server"].setup({
			-- on_attach = on_attach,
			on_attach = require("jpv.lsp.plugins.handlers").on_attach,
			capabilities = require("jpv.lsp.plugins.handlers").capabilities,
		})

		lspconfig["pyright"].setup({
			-- on_attach = on_attach,
			on_attach = require("jpv.lsp.plugins.handlers").on_attach,
			capabilities = require("jpv.lsp.plugins.handlers").capabilities,
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
	end,
}
