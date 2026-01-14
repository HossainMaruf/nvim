syntax on "detect language syntax
set nocompatible
filetype plugin indent on

set number "set line number
set relativenumber "set relative line number
set ruler
set showcmd
set hidden
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
set incsearch
set hlsearch
"set clipboard=unnamedplus

set guioptions-=m "disable menubar
set guioptions-=T "disable toolbar
set guioptions-=r "disable right scrollbar
set guioptions-=l "disable left scrollbar
set guioptions-=b "disable bottom scrollbar
set guioptions-=mT "for clean gvim
set guifont=Consolas:h11
set cursorline
set linespace=2

let mapleader = " "

"------------------------- BASIC START --------------------------------
inoremap jk <ESC> "go to normal mode
inoremap kj <ESC> "go to normal mode
nnoremap <leader>w :w<CR> "write in file
nnoremap <leader>q :q<CR> "close the window
nnoremap <leader>nh :noh<CR> "clear highlight
"------------------------- BASIC END --------------------------------

"------------------------- TAB START --------------------------------
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprevious<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

nnoremap tc :tabclose<CR>
nnoremap tC :tabonly<CR>
nnoremap tq :tabdo q<CR>
"------------------------- TAB END --------------------------------

"------------------------- TERMINAL START --------------------------------
nnoremap tt :terminal<CR>
nnoremap <leader>th :split \| terminal<CR>
nnoremap <leader>tv :vsplit \| terminal<CR>
tnoremap <ESC> <C-\\><C-n>
"------------------------- TERMINAL END --------------------------------

"------------------------- WINDOW START --------------------------------
"Window Splitting
nnoremap hs :split<CR>
nnoremap vs :vsplit<CR>

"Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"Window Resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
nnoremap <C-e> <C-w>= "make all windows equal height and width
nnoremap <C-x> <C-w>x "exchange current window with next one
"------------------------- WINDOW END --------------------------------
