filetype off
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
set number
set nocompatible
set scrolloff=1
set noswapfile
set showcmd

set list
set listchars=tab:▸\ ,trail:¬

"let &t_SI = "\<Esc>[6 q"
"let &t_EI = "\<Esc>[2 q"

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

"set expandtab
"set softtabstop=8
set hidden

command W w !sudo tee % > /dev/null
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:livepreview_previewer = 'zathura'
