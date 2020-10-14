set bg=dark

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTree'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'neomake/neomake'
Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'ervandew/supertab'
Plug 'sebdah/vim-delve'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
let ayucolor="dark"

" colorscheme ayu
" colorscheme gruvbox
noremap <C-n>t :tabnew<CR>
noremap <C-v>sp :vsp<CR>
nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-v> "+gP
vnoremap <C-v> "+gP

set laststatus=2 "For status line to properly work
set mouse=a 

set t_Co=256
set t_ut=

" Set tabs
set tabstop=2
set softtabstop=2 noexpandtab
set shiftwidth=2


" File stuff
filetype indent on
filetype plugin on

" vim config
set termguicolors
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

let g:go_fmt_command = 'goimports'
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_updatetime = 400
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_info_mode = 'gopls'
let g:go_def_mode = 'gopls'
let g:go_referrers_mode = 'gopls'
let g:go_def_mode = 'gopls'
let g:go_rename_command = 'gopls'


" deoplete
let g:deoplete#enable_at_startup=1

call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})


" Pane splitting
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

map ; :NERDTreeToggle<CR>

" vim airline
if !exists('g:sp_airline_disable_powerline_fonts') || g:sp_airline_disable_powerline_fonts == 0
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 0
  let g:airline_symbols.space = "\ua0"
endif
let g:airline_theme='dark_minimal'

" Close nerdtree if I am closing the editor
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
