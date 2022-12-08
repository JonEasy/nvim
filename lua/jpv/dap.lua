local dap = require("dap")
local dapui = require("dapui")

dap.listeners.after["event_initialized"]["dapui_config"] = function()
	print("Opening UI")
	dapui.open()
end
dap.listeners.before["event_terminated"]["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before["event_exited"]["dapui_config"] = function()
	dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🞂", texthl = "LspDiagnosticsDefaultInformation", linehl = "CursorLine" })
vim.fn.sign_define("DapLogPint", { text = "◉", texthl = "LspDiagnosticsDefaultError" })

-- Adapter configuration
local HOME = os.getenv("HOME")
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/kotlin-debug-adapter"

dap.adapters.kotlin = {
	type = "executable",
	command = DEBUGGER_LOCATION .. "/adapter/build/install/adapter/bin/kotlin-debug-adapter",
	args = { "--interpreter=vscode" },
}

dap.adapters.python = {
	type = "executable",
	command = "/home/jonel/anaconda3/envs/py36/bin/python",
	args = { "-m", "debugpy.adapter" },
	--  options = {
	--    cwd = '${workspaceFolder}',
	--  },
}
-- dap.defaults.fallback.external_terminal = {
--   command = '/usr/bin/bash';
--   args = {'-e'};
-- }

-- Configuration
dap.configurations.kotlin = {
	{
		type = "kotlin",
		name = "launch - kotlin",
		request = "launch",
		projectRoot = vim.fn.getcwd(),
		mainClass = function()
			-- return vim.fn.input("Path to main class > ", "myapp.sample.app.AppKt", "file")
			return vim.fn.input("Path to main class > ", "", "file")
		end,
	},
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		-- console = "integratedTerminal",
		-- module = "unittest",
		cwd = "/mnt/c/Users/212756951/Documents/GitHub/controlled-plugins/tower_shell_wt19", --"${workspaceFolder}",
		-- args = { "case", "download_file", "1497", "run6792/turbine1/manifest.efno.json" },
		program = "${file}", -- "/mnt/c/Users/212756951/Documents/GitHub/sdm-cli/sdmcli/cli/__main__.py",
		env = {
			pythonPath = "${workspaceFolder}",
		},
		pythonPath = function()
			--local cwd = "${fileDirname}"
			return "/home/jonel/anaconda3/envs/py36/bin/python"
		end,
	},
	{
		type = "python",
		request = "launch",
		name = "Cli Config",
		-- console = "integratedTerminal",
		-- module = "unittest",
		cwd = "${workspaceFolder}",
		-- args = { "case", "download_file", "1497", "run6792/turbine1/manifest.efno.json" },
		program = "${file}", -- "/mnt/c/Users/212756951/Documents/GitHub/sdm-cli/sdmcli/cli/__main__.py",
		pythonPath = function()
			--local cwd = "${fileDirname}"
			return "/home/jonel/anaconda3/envs/py36/bin/python"
		end,
	},
	{
		type = "python",
		request = "launch",
		name = "SDMSTATS",
		-- console = "integratedTerminal",
		-- module = "unittest",
		cwd = "${workspaceFolder}",
		program = "${file}", -- "/mnt/c/Users/212756951/Documents/GitHub/sdm-cli/sdmcli/cli/__main__.py",
		pythonPath = function()
			--local cwd = "${fileDirname}"
			return "/home/jonel/anaconda3/envs/py36/bin/python"
		end,
	},
}

-- dapui.setup({
-- 	icons = {
-- 		expanded = "⯆",
-- 		collapsed = "⯈",
-- 	},
-- 	mappings = {
-- 		expand = { "<CR>", "<LeftMouse>" },
-- 		open = { "o" },
-- 		remove = { "d", "x" },
-- 		edit = { "c" },
-- 		repl = { "r" },
-- 	},
-- 	layouts = {
-- 		{
-- 			elements = {
-- 				"breakpoints",
-- 				"watches",
-- 				"stacks",
-- 				"scopes",
-- 			},
-- 			size = 40,
-- 			position = "right",
-- 		},
-- 		tray = {
-- 			elements = { "repl", "console" },
-- 			size = 10,
-- 			position = "bottom",
-- 		},
-- 	},
-- 	floating = {
-- 		max_height = nil, -- Either absolute integer or float
-- 		max_width = nil, -- between 0 and 1 (size relative to screen size)
-- 	},
-- })
require("dapui").setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Use this to override mappings for specific elements
	element_mappings = {
		-- Example:
		-- stacks = {
		--   open = "<CR>",
		--   expand = "o",
		-- }
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
})
