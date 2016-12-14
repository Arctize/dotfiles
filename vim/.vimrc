filetype off
execute pathogen#infect()
filetype plugin indent on
syntax on

set mouse=a

set ruler
set cul
set showcmd

set number
set relativenumber

set autoindent

set hlsearch
set incsearch

set ignorecase
set smartcase

set nocompatible

set scrolloff=5

set noswapfile

if has('persistent_undo')
	set undofile                " Save undo's after file closes
	set undodir=$HOME/.vim/undo " where to save undo histories
	set undolevels=1000         " How many undos
	set undoreload=10000        " number of lines to save for undo
endif

set list
set listchars=tab:▸\ ,trail:¬,nbsp:¬

let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"

":autocmd InsertEnter * set cul
":autocmd InsertLeave * set nocul

"set expandtab
"set softtabstop=8
set hidden

command W w !sudo tee % > /dev/null " For saving a read-only file as root

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:livepreview_previewer = 'zathura'

fun! RmTrail()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfun
