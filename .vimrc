call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " finder which is mapped to ';'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

map ; :Files<CR>
noremap <C-n>t :tabnew<CR>
noremap <C-v>sp :vsp<CR>

nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-v> "+gP
vnoremap <C-v> "+gP

set laststatus=2 "For status line to properly work

if has('mouse')
  set mouse=a
endif 

set t_Co=256
set t_ut=

" colorscheme candid

" Set tabs
set tabstop=2
set softtabstop=2 noexpandtab
set shiftwidth=2


" File stuff
filetype indent on
filetype plugin on

" vim config
set expandtab
set hidden
set magic
set number
set autoindent
set smartindent
set smarttab
set ruler
set modeline
set showcmd
set showmode
set showmatch
set autoread
set autowrite
set showfulltag
set noswapfile
set smartcase
set ignorecase
set wildmenu
set splitbelow
set splitright
set hlsearch
set foldlevel=99999
set clipboard=unnamedplus
set autowrite
set noshowmode
set backspace=indent,eol,start
set synmaxcol=128

let g:deoplete#enable_at_startup = 1

let g:go_fmt_command = 'goimports'
let g:go_def_mode = 'gopls'
let g:go_auto_sameids = 1
let g:go_info_mode = 'gopls'
let g:go_auto_type_info = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Pane splitting
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
