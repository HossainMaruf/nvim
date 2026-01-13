set number
set relativenumber
" set paste
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set mouse=a
set encoding=UTF-8
" VScode will replace that
let mapleader = " "
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			" Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
"set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set laststatus=0                        " Always display the status line
"set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autochdir                           " Your working directory will always be the same as your working directory

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Write and Quit in easy way
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Switching buffer
nnoremap <leader>n :bnext<CR>
nnoremap <TAB> :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <S-TAB> :bprevious<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h<ESC> " go to vertical left window 
nnoremap <C-l> <C-w>l<ESC> " go to vertical right window 
nnoremap <C-j> <C-w>j<ESC> " go to horizontal bottom window 
nnoremap <C-k> <C-w>k<ESC> " go to horizontal top window 

" Splitting Window
nnoremap <leader>h :split<CR><ESC>   " split window horizontally
nnoremap <leader>v :vsplit<CR><ESC>  " split window vertically
