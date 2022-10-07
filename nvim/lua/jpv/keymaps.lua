M = {}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)
keymap("n", "<leader>e",":NerdTreeToggle<CR>",opts)
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>",opts)
-- Tabs --
keymap("n", "<enter>", ":tabnew %<cr>", opts)
keymap("n", "<s-enter>", ":tabclose<cr>", opts)
keymap("n", "<m-\\>", ":tabonly<cr>", opts)

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

-- keymap("n", "n", "nzzzv", opts)
-- keymap("n", "N", "Nzzzv", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- keymap("n", "<RightMouse>", ":Alpha<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

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

-- local keymap = vim.api.nvim_set_keymap
keymap("n","al",":echo 'Testo'<cr>",opts)
--vim.api.nvim_set_keymap("n","al",":echo 'hello'<cr>",opts)



-- Telescope
keymap("n","<leader>ff",":Telescope find_files<cr>",opts)
keymap("n","<leader>fg",":Telescope live_grep<cr>",opts)
keymap("n","<leader>fb",":Telescope buffers<cr>",opts)
keymap("n","<leader>fh",":Telescope help_tags<cr>",opts)

-- Adapter
keymap("n","<leader>bg",":DapToggleBreakpoint<CR>",opts)
keymap("n","<F7>",":DapStepInto<CR>",opts)
keymap("n","S-<F7>",":DapStepOut<CR>",opts)
keymap("n","<F8>",":DapStepOver<CR>",opts)
keymap("n","<F10>",":DapContinue<CR>",opts)
--keymap("n","<leader>di",":lua require('dap.ui.variables').hover(function() return vim.fn.expand('"<cexpr>"') end)<CR>",opts)
keymap("n","<leader>di",":lua require('dap.ui.variables').visual_hover()<CR>",opts)
keymap("n","<leader>ds",":lua require('dap.ui.variables').scopes()<CR>",opts)
keymap("n", "<Leader>di", ":lua require('dapui').toggle()<CR>",opts)
-- Vim Test
keymap("n","<leader>t",":TestNearest<CR>",opts)


-- Autocompletion
-- keymap("i","<expr><Tab>","<cmd>pumvisible()",opts)

