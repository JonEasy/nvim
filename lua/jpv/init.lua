require("jpv.core")
require("jpv.lazyvim")
require("lazy").setup({ { import = "jpv.plugins" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
-- require("jpv.autopairs")
-- require("jpv.telescope")
-- require("jpv.nvim-cmp")
-- require("jpv.lsp")
-- require("jpv.options")
-- require("jpv.keymaps")
-- require("jpv.toggleterm")
-- require("jpv.treesitter")
-- require("jpv.lualine")
-- require("jpv.gitsigns")
-- require("jpv.project")
-- require("jpv.dap") -- require('jpv.coc')
-- source this last
--require("jpv.colorscheme")

-- require("jpv.nvimtree-config")
-- require("nvim-tree").setup()
-- require("jpv.nvimtree-config")
-- require("nvimtree-config")
