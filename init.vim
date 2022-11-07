call plug#begin(stdpath('data') . '/plugged')

Plug 'windwp/nvim-autopairs' " Autopairs, integrates with both cmp and treesitter
Plug 'nvim-lua/plenary.nvim' " Telescope. Requires plenary to function 
Plug 'nvim-telescope/telescope.nvim' " The main Telescope plugin
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' } " An optional plugin recommended by Telescope docs

Plug 'tpope/vim-commentary' " Comenting

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'vim-airline/vim-airline' " Vim Airline

Plug 'williamboman/mason.nvim' "New generation Code Server
Plug 'williamboman/mason-lspconfig.nvim'

" Configuring lsp servers
Plug 'neovim/nvim-lspconfig' " Configure LSP server
Plug 'glepnir/lspsaga.nvim' 
Plug 'hrsh7th/cmp-nvim-lsp' " Autocompletion
Plug 'onsails/lspkind.nvim' " vs.code like icons for autocompletion

" Completion
Plug 'hrsh7th/nvim-cmp' " The completion plugin
Plug 'hrsh7th/cmp-buffer' "  buffer completions
Plug 'hrsh7th/cmp-path' "  path completions
Plug 'hrsh7th/cmp-cmdline' "  cmdline completions
Plug 'hrsh7th/cmp-nvim-lua'

" Snippets
Plug 'saadparwaiz1/cmp_luasnip' "  snippet completions
Plug 'rafamadriz/friendly-snippets' " a bunch of snippets to use
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}

" Linters and formatter
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jayp0521/mason-null-ls.nvim'

" Git Signs
Plug 'lewis6991/gitsigns.nvim'


Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " Tokyo colorscheme
Plug 'EdenEast/nightfox.nvim' " Color scheme
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Color scheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" Plug 'https://github.com/ap/vim-css-color'
Plug 'doums/darcula'
" Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

Plug 'nvim-lualine/lualine.nvim' " LuaLine

Plug 'preservim/tagbar' " Tagbar For code completion
Plug 'preservim/nerdtree' " Nerdtree


" Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

"
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion
" Plug 'nvim-lua/completion-nvim' " Completion  
Plug 'mfussenegger/nvim-jdtls' " Eclipse for java


Plug 'RRethy/vim-illuminate' 

Plug 'udalov/kotlin-vim' " Kotlin Plugin for highilht


Plug 'nvim-treesitter/nvim-treesitter' " Tree Sitters
Plug 'nvim-treesitter/playground'

Plug 'preservim/tagbar' " Tag Bar for code navigation

Plug 'tpope/vim-surround' " Vim surround

Plug 'mfussenegger/nvim-dap' " Debugger
Plug 'rcarriga/nvim-dap-ui'

Plug 'vim-test/vim-test' " Vim Testing

Plug 'ThePrimeagen/vim-be-good' " Practicing

Plug 'gennaro-tedesco/nvim-jqx' " Json file validator

Plug 'nvim-tree/nvim-tree.lua'

Plug 'kyazdani42/nvim-web-devicons' " If you want to have icons in your statusline choose one of these
Plug 'ryanoasis/vim-devicons'

" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'epwalsh/obsidian.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()


nmap <F8> :TagbarToggle<CR>

" let base16colorspace=256  " Access colors present in 256 colorspace
" show hover doc
let g:learn_path = $HOME . "/onewind"

" do not close the preview tab when switching to other buffers
let g:vim_markdown_folding_disabled = 1
let g:mkdp_auto_start = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_markdown_css = ''
let g:mkdp_browser = 'firefox'


lua require('jpv')
" lua print(vim.fn.stdpath('data'))


" Autocommand reloading file whenever it is being saved
" vim.cmd([
"   \ autogroup vim-plug-config
"       autocmd!
"       autocmd BufWritePost init.vim source <afile> | PlugInstall
"       autogroup end
"   \ ])






