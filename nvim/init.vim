set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set smartcase
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber			" line numbers relative to cursor
set numberwidth=4           " Columns used for line number
set incsearch               " Highlights matched text
set hidden                  " Navigate buffer without losing usaved work
set scrolloff=10            " Start scrolling when 8 lines from top / bottom
set undofile                " Save undo file
set mouse=a                 " Enable mouse support
set wildmode=longest,list   " get bash-like tab completions
set cc=100                  " set an 100 column border for good coding style
set termguicolors           " Better colors
set noshowmode              " No `-- INSERT --` thingy
set signcolumn=number       " Display line number
set clipboard=unnamedplus	" copy to system clipboard
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting


" from a sketchy idie.ru post, no shit of how it works nor what it does
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
colorscheme nord
set background=dark

lua require('boj')

