require("jpv.lsp.mason")
require("jpv.lsp.lspsaga")
require("jpv.lsp.handlers").setup()
require("jpv.lsp.lspconfig")
require("jpv.lsp.null-ls")
-- local servers = {'pyright','tsserver','kotlin_language_server', 'kotlin_language_server'}

-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--     on_attach = require("jpv.lsp.handlers").on_attach,
--     capabilities = require("jpv.lsp.handlers").capabilities,
--     flags = {
--       -- This will be the default in neovim 0.7+
--       debounce_text_changes = 150,
--     }
--   }
-- end
-- nvm_lsp.kotlin_language_server.setup {
--   on_attach = require("jpv.lsp.handlers").on_attach,
--   capabilities = require("jpv.lsp.handlers").capabilities,
--   filetypes = {"kotlin"}
-- }

-- require("jpv.lsp.handlers").setup()
