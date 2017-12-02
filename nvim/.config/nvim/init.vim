"" Vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'https://github.com/neomake/neomake'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
Plug 'https://github.com/vim-scripts/JavaDecompiler.vim'

call plug#end()


"" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" UltiSnips
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
	let snippet = UltiSnips#ExpandSnippetOrJump()
	if g:ulti_expand_or_jump_res > 0
		return snippet
	else
		return "\<CR>"
	endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"


" Neomake
call neomake#configure#automake('w')

au BufRead,BufNewFile *.tex setlocal textwidth=80

set foldmethod=marker
set guicursor=n-v-c-sm:block,i-ci-ve:ver1,r-cr-o:hor1

set list
set listchars=tab:▸\ ,trail:¬,nbsp:¬

set cul
set scrolloff=3
set mouse=a

set number
set relativenumber

set noswapfile

if has('persistent_undo')
	set undofile                " Save undo's after file closes
	set undodir=$HOME/.vim/undo " where to save undo histories
	set undolevels=1000         " How many undos
	set undoreload=10000        " number of lines to save for undo
endif

"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
