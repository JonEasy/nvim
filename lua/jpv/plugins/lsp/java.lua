return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mfussenegger/nvim-jdtls" },
		opts = {
			setup = {
				jdtls = function(_, opts)
					vim.api.nvim_create_autocmd("FileType", {
						pattern = "java",
						callback = function()
							require("lazyvim.util").on_attach(function(_, buffer)
								vim.keymap.set(
									"n",
									"<leader>di",
									"<Cmd>lua require'jdtls'.organize_imports()<CR>",
									{ buffer = buffer, desc = "Organize Imports" }
								)
								vim.keymap.set(
									"n",
									"<leader>dt",
									"<Cmd>lua require'jdtls'.test_class()<CR>",
									{ buffer = buffer, desc = "Test Class" }
								)
								vim.keymap.set(
									"n",
									"<leader>dn",
									"<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
									{ buffer = buffer, desc = "Test Nearest Method" }
								)
								vim.keymap.set(
									"v",
									"<leader>de",
									"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
									{ buffer = buffer, desc = "Extract Variable" }
								)
								vim.keymap.set(
									"n",
									"<leader>de",
									"<Cmd>lua require('jdtls').extract_variable()<CR>",
									{ buffer = buffer, desc = "Extract Variable" }
								)
								vim.keymap.set(
									"v",
									"<leader>dm",
									"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
									{ buffer = buffer, desc = "Extract Method" }
								)
								vim.keymap.set(
									"n",
									"<leader>cf",
									"<cmd>lua vim.lsp.buf.formatting()<CR>",
									{ buffer = buffer, desc = "Format" }
								)
							end)

							local home = vim.env.HOME
							local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/"
							local equinox_version = "1.6.500.v20230717-2134"
							local DEBUGGER_LOCATION = vim.fn.stdpath("data")
							-- local equinox_version = "1.6.200.v20220720-2012.jar"

							WORKSPACE_PATH = home .. "/workspace/"
							if vim.fn.has("mac") == 1 then
								OS_NAME = "mac"
							elseif vim.fn.has("unix") == 1 then
								OS_NAME = "linux"
							elseif vim.fn.has("win32") == 1 then
								OS_NAME = "win"
							else
								vim.notify("Unsupported OS", vim.log.levels.WARN)
							end

							local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }

							local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

							local workspace_dir = WORKSPACE_PATH .. project_name

							local capabilities = vim.lsp.protocol.make_client_capabilities()
							local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
							if not status_cmp_ok then
								return
							end
							capabilities.textDocument.completion.completionItem.snippetSupport = false
							capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

							local bundles = {
								vim.fn.glob(
									DEBUGGER_LOCATION
										.. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
								),
							}

							vim.list_extend(
								bundles,
								vim.split(
									vim.fn.glob(
										DEBUGGER_LOCATION
											.. "/vscode-java-test/server/com.microsoft.java.test.plugin-*.jar"
									),
									"\n"
								)
							)
							-- vim.lsp.set_log_level('DEBUG')
							local config = {
								-- The command that starts the language server
								-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line

								cmd = {
									-- 💀
									"java", --/usr/lib/jvm/openjdk-17/bin/java", -- or '/path/to/java17_or_newer/bin/java'
									-- depends on if `java` is in your $PATH env variable and if it points to the right version.
									-- "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044",
									"-Declipse.application=org.eclipse.jdt.ls.core.id1",
									"-Dosgi.bundles.defaultStartLevel=4",
									"-Declipse.product=org.eclipse.jdt.ls.core.product",
									"-Dlog.protocol=true",
									"-Dlog.level=ALL",
									"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
									"-Xms1g",
									"--add-modules=ALL-SYSTEM",
									"--add-opens",
									"java.base/java.util=ALL-UNNAMED",
									"--add-opens",
									"java.base/java.lang=ALL-UNNAMED",
									-- 💀
									"-jar",
									jdtls_path .. "plugins/org.eclipse.equinox.launcher_" .. equinox_version .. ".jar",
									-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
									-- Must point to the                                                     Change this to
									-- eclipse.jdt.ls installation                                           the actual version
									-- 💀
									"-configuration",
									jdtls_path .. "config_" .. OS_NAME,
									-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
									-- Must point to the                      Change to one of `linux`, `win` or `mac`
									-- eclipse.jdt.ls installation            Depending on your system.

									"-data",
									workspace_dir,
								},

								-- This is the default if not provided, you can remove it. Or adjust as needed.
								-- One dedicated LSP server & client will be started per unique root_dir
								root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

								-- Here you can configure eclipse.jdt.ls specific settings
								-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
								-- for a list of options
								settings = {
									java = {},
								},

								on_attach = require("jpv.core.handlers").on_attach,
								capabilities = require("jpv.core.handlers").capabilities,
							}
							require("jdtls").start_or_attach(config)
						end,
					})
					return true
				end,
			},
		},
	},
}
