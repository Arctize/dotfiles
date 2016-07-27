execute pathogen#infect()
filetype plugin indent on
syntax on
set mouse=a
set ruler
set autoindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set relativenumber
set nocompatible
set scrolloff=1

"set listchars=tab:▸\ ,eol:¬
"set list
"set expandtab
"set softtabstop=8
set hidden

command W w !sudo tee % > /dev/null
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
