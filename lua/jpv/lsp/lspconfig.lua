
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	print("Returning.Not importing lspconfig")
  return
end



lspconfig["sumneko_lua"].setup({
	on_attach = require('jpv.lsp.handlers').on_attach,
	capabilities = require('jpv.lsp.handlers').capabilities,
})

lspconfig["kotlin_language_server"].setup({
	-- on_attach = on_attach,
	on_attach = require('jpv.lsp.handlers').on_attach,
	capabilities = require('jpv.lsp.handlers').capabilities,
})


lspconfig["pyright"].setup({
	-- on_attach = on_attach,
	on_attach = require('jpv.lsp.handlers').on_attach,
	capabilities = require('jpv.lsp.handlers').capabilities,
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
