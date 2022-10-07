call plug#begin(stdpath('data') . '/plugged')

Plug 'udalov/kotlin-vim' " Kotlin Plugin for highilht

Plug 'nvim-lua/plenary.nvim' " Telescope. Requires plenary to function 
Plug 'nvim-telescope/telescope.nvim' " The main Telescope plugin
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' } " An optional plugin recommended by Telescope docs

Plug 'tpope/vim-commentary' " Comenting

Plug 'vim-airline/vim-airline' " Vim Airline

Plug 'williamboman/mason.nvim' "New generation Code Server
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'neovim/nvim-lspconfig' " Lnguage Server Protocol 
" Plug 'williamboman/nvim-lsp-installer'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }


Plug 'EdenEast/nightfox.nvim' " Color scheme
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Color scheme
" Plug 'https://github.com/ap/vim-css-color'
Plug 'doums/darcula'
" Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

Plug 'nvim-lualine/lualine.nvim' " LuaLine

Plug 'preservim/tagbar' " Tagbar For code completion
Plug 'preservim/nerdtree' " Nerdtree

Plug 'kyazdani42/nvim-web-devicons' " If you want to have icons in your statusline choose one of these
Plug 'ryanoasis/vim-devicons'

" Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

"
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion
" Plug 'nvim-lua/completion-nvim' " Completion  
Plug 'mfussenegger/nvim-jdtls' " Eclipse for java

Plug 'hrsh7th/nvim-cmp' " The completion plugin
Plug 'hrsh7th/cmp-buffer' "  buffer completions
Plug 'hrsh7th/cmp-path' "  path completions
Plug 'hrsh7th/cmp-cmdline' "  cmdline completions
Plug 'saadparwaiz1/cmp_luasnip' "  snippet completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

Plug 'L3MON4D3/LuaSnip' " snippet engine
Plug 'rafamadriz/friendly-snippets' " a bunch of snippets to use

Plug 'nvim-treesitter/nvim-treesitter' " Tree Sitters

Plug 'preservim/tagbar' " Tag Bar for code navigation

Plug 'tpope/vim-surround' " Vim surround

Plug 'mfussenegger/nvim-dap' " Debugger
Plug 'rcarriga/nvim-dap-ui'

Plug 'vim-test/vim-test' " Vim Testing

Plug 'ThePrimeagen/vim-be-good' " Practicing

Plug 'gennaro-tedesco/nvim-jqx' " Json file validator

call plug#end()

syntax on

" source ~/.config/coc/coc_keymap.vim

" Nerdtree
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapse='-'
noremap <C-f> :NERDTreeFocus<CR>
noremap <C-s> :NERDTree<CR>
noremap <C-x> :NERDTreeToggle<CR>
" noremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

let base16colorspace=256  " Access colors present in 256 colorspace


set completeopt=menuone,noinsert,noselect
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>



" lua print(vim.fn.stdpath('data'))



" Important modules
lua require('jpv')




