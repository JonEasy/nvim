

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
require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },
            bordered = 'rounded'
        }
    })

local status_ok, nvm_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end


require("jpv.lsp.handlers").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
  function(server)
    local opts = {
      on_attach = require("jpv.lsp.handlers").on_attach(server),
      capabilities = require("jpv.lsp.handlers").capabilities,
    }

    if server == "sumneko_lua" then
        local sumneko_opts = require("jpv.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end
    if server == "kotlin_language_server" then
      local kotlin_ls = require("jpv.lsp.settings.kotlin_ls")
      opts = vim.tbl_deep_extend("force", kotlin_ls, opts)
    end

    require("lspconfig")[server].setup{opts}
  end,
  })

