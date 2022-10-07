local dap = require("dap")
local dapui = require("dapui")


dap.listeners.after['event_initialized']["dapui_config"] = function()
  print("Opening UI")
  dapui.open()
end
dap.listeners.before['event_terminated']["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before['event_exited']["dapui_config"] = function()
  dapui.close()
end


vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped',{text='🞂', texthl='LspDiagnosticsDefaultInformation', linehl='CursorLine'})
vim.fn.sign_define('DapLogPint', {text='◉', texthl='LspDiagnosticsDefaultError'})

-- Adapter configuration
local HOME = os.getenv "HOME"
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/kotlin-debug-adapter"

dap.adapters.kotlin = {
  type = "executable",
  command = DEBUGGER_LOCATION .. "/adapter/build/install/adapter/bin/kotlin-debug-adapter",
  args = { "--interpreter=vscode" },
}

dap.adapters.python = {
  type='executable',
  command = '/home/jonel/anaconda3/envs/py36/bin/python',
  args = {'-m', 'debugpy.adapter'},
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
    type = 'python';
    request = 'launch';
    name = "Run unittest";
    module = "unittest",
    cwd = '${workspaceFolder}';
    --program = '${file}';
    pythonPath = function()
      --local cwd = "${fileDirname}"
      return '/home/jonel/anaconda3/envs/py36/bin/python'
    end;
  },
}



dapui.setup({
	icons = {
		expanded = '⯆',
		collapsed = '⯈'
	},
	mappings = {
		expand = {'<CR>', '<LeftMouse>'},
		open = {'o'},
		remove = {'d', 'x'},
		edit = {'c'},
		repl = {'r'},
	},
	layouts = {
		{
			elements = {
				'breakpoints',
				'watches',
				'stacks',
				'scopes',
			},
			size = 40,
			position = 'right',
		},
		tray = {
			elements = {'repl', 'console'},
			size = 10,
			position = 'bottom',
		},
	},
	floating = {
		max_height = nil,  -- Either absolute integer or float
		max_width  = nil,  -- between 0 and 1 (size relative to screen size)
	}
})
