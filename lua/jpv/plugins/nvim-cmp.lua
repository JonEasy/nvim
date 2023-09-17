return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
    	print("Returning. Plugin cmp not present")
    	return
    end
    
    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
    	print("Returning. Plugin luasnip not present")
    	return
    end
    
    -- import lspkind plugin safely
    local lspkind_status, lspkind = pcall(require, "lspkind")
    if not lspkind_status then
    	print("Returning. Plugin lspkind not present")
    	return
    end
    
    require("luasnip/loaders/from_vscode").lazy_load()
    
    local check_backspace = function()
    	local col = vim.fn.col(".") - 1
    	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end
    
    --   פּ ﯟ   some other good icons
    local kind_icons = {
    	Text = "",
    	Method = "m",
    	Function = "",
    	Constructor = "",
    	Field = "",
    	Variable = "",
    	Class = "",
    	Interface = "",
    	Module = "",
    	Property = "",
    	Unit = "",
    	Value = "",
    	Enum = "",
    	Keyword = "",
    	Snippet = "",
    	Color = "",
    	File = "",
    	Reference = "",
    	Folder = "",
    	EnumMember = "",
    	Constant = "",
    	Struct = "",
    	Event = "",
    	Operator = "",
    	TypeParameter = "",
    }
    -- find more here: https://www.nerdfonts.com/cheat-sheet
    cmp.setup({
    	snippet = {
    		expand = function(args)
    			luasnip.lsp_expand(args.body) -- For `luasnip` users.
    		end,
    	},
    	mapping = {
    		["<C-k>"] = cmp.mapping.select_prev_item(),
    		["<C-j>"] = cmp.mapping.select_next_item(),
    		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    		["<C-e>"] = cmp.mapping({
    			i = cmp.mapping.abort(),
    			c = cmp.mapping.close(),
    		}),
    		-- Accept currently selected item. If none selected, `select` first item.
    		-- Set `select` to `false` to only confirm explicitly selected items.
    		["<CR>"] = cmp.mapping.confirm({ select = true }),
    		["<Tab>"] = cmp.mapping(function(fallback)
    			if cmp.visible() then
    				cmp.select_next_item()
    			elseif luasnip.expandable() then
    				luasnip.expand()
    			elseif luasnip.expand_or_jumpable() then
    				luasnip.expand_or_jump()
    			elseif check_backspace() then
    				fallback()
    			else
    				fallback()
    			end
    		end, {
    			"i",
    			"s",
    		}),
    		["<S-Tab>"] = cmp.mapping(function(fallback)
    			if cmp.visible() then
    				cmp.select_prev_item()
    			elseif luasnip.jumpable(-1) then
    				luasnip.jump(-1)
    			else
    				fallback()
    			end
    		end, {
    			"i",
    			"s",
    		}),
    	},
    	formatting = {
    		format = lspkind.cmp_format({
    			maxwidth = 50,
    			ellipsis_char = "...",
    		}),
    	},
    	sources = {
    		{ name = "nvim_lsp" },
    		{ name = "luasnip" },
    		{ name = "buffer" },
    		{ name = "path" },
    	},
    	confirm_opts = {
    		behavior = cmp.ConfirmBehavior.Replace,
    		select = false,
    	},
    	window = {
    		documentation = {
    			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    		},
    	},
    	experimental = {
    		ghost_text = false,
    		native_menu = false,
    	},
    })
  end
}
