require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
  function(server)
    local opts = {
      on_attach = require("jpv.lsp.handlers").on_attach,
      capabilities = require("jpv.lsp.handlers").capabilities,
    }
    -- for key,value in pairs(opts) do 
    --   print("Key is " .. key)
    --   if (type(value) == "table") then
    --     for key2, value2 in pairs(value) do
    --       print("Key 2 is " .. key2)
    --       if (type(value2)~= "table") then
    --         print("Value2 is " .. value)
    --       end
    --     end
    --   end
    -- end
    if server == "sumneko_lua" then
        print("Inside" .. server)
        local sumneko_opts = require("jpv.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end
    if server == "kotlin_language_server" then
      print("Inside" .. server)
      local kotlin_ls = require("jpv.lsp.settings.kotlin_ls")
      opts = vim.tbl_deep_extend("force", kotlin_ls, opts)
    end
    -- print("For server " .. server) 
    -- for key, value in pairs(opts) do
    --   print("Has key ".. key)
    -- end
    require("lspconfig")[server].setup{opts}
  end
  })

