local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  print("Not using lsp installer")
  return
end


-- Register a handler that will be called for all installed servers
-- Alternativerly you may also register handlers on specific server instancers instead
--
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("jpv.lsp.handlers").on_attach, 
    capabilities = require("jpv.lsp.handlers").capabilities,
  }


  -- This setup() function is exactly the same as lspconfig's setup function
  -- Refer to http://github.com/neovim/nvim-lsp-config/blob/master/doc/server_configuration.md
  server:setup(opts)
end)

