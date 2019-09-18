" Vim-plug
call plug#begin('~/.local/share/nvim/plugged')

"Plug 'https://github.com/joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'Chiel92/vim-autoformat'
Plug 'https://github.com/mbbill/undotree'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'blueshirts/darcula'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'https://github.com/neomake/neomake'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
Plug 'https://github.com/vim-scripts/JavaDecompiler.vim'
Plug 'majutsushi/tagbar'

call plug#end()

colorscheme onedark

let mapleader=";"

nnoremap <F5> :UndotreeToggle<cr>
nnoremap <c-s> :w <cr>
nnoremap <c-t> :Autoformat <cr>

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" Toggle NERDTree
nnoremap <silent> <Space> :NERDTreeToggle<CR>

" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" toggle line wrap
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>


" Neomake
call neomake#configure#automake('w')


set foldmethod=marker
set guicursor=n-v-c-sm:block,i-ci-ve:ver1,r-cr-o:hor1

set number
set list
set listchars=tab:▸\ ,trail:¬,nbsp:¬

set cul
set scrolloff=3
set mouse=a

set ruler

set noshowmode

set cindent
set noswapfile

if has('persistent_undo')
	set undofile                " Save undo's after file closes
	set undodir=$HOME/.cache/undo " where to save undo histories
	set undolevels=1000         " How many undos
	set undoreload=10000        " number of lines to save for undo
endif

let g:airline_powerline_fonts = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" vimtex
let g:vimtex_view_general_viewer = 'zathura'

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


