M = {}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- General keymaps
keymap("n", "<leader>+", "<C-a>", opts) -- increment
keymap("n", "<leader>-", "<C-x>", opts) -- decrement

keymap("i", "jk", "<ESC>l", opts) -- return to "v"mode from "i"

keymap("n", "x", '"_x', opts) -- delete single character wihtout copying into register

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- local M = {}
-- local function bind(opt, outer_opts)
--   outer_opts = outer_opts or {noremap = true}
--   return function(lhs, rhs, opts)
--     opts = vim.tbl_extend("force", outer_opts, opts or {})
--     vim.keymap.set(opt, lhs, rhs, opts)
--   end
-- end
-- M.noremap = bind("n", {noremap = false})
-- M.noremap = bind("n")
-- M.noremap = bind("v")
-- M.noremap = bind("i")
-- return M

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tabs --
keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<S-t>", ":tabn<CR>", opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab
-- keymap("n", "<enter>", ":tabnew %<cr>", opts)
-- keymap("n", "<s-enter>", ":tabclose<cr>", opts)
-- keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- I hate typing these
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)
keymap("x", "H", "^", opts)
keymap("x", "L", "$", opts)
keymap("o", "H", "^", opts)
keymap("o", "L", "$", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

---- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", opts) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts) -- list current changes per file with diff preview ["gs" for git status]

---- Nvimtree
keymap("n", "<C-x>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>f", ":Format<cr>", opts)

-- Nvim DAP
keymap("n", "<leader>dk", ":DapContinue()", opts) --  function() require('dap').continue() end)
-- keymap("n", "<leader>dl", function()
-- 	require("dap").run_last()
-- end)
-- keymap("n", "<leader>b", function()
-- 	require("dap").toggle_breakpoint()
-- end)
