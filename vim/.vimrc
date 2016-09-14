set nocompatible	" be iMproved, required
filetype off

" =========================
" Plugins
" =========================
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/neocomplete.vim'

call plug#end()
" =========================
" End Plugins
" =========================

filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized

set incsearch			" Show next match while entering search
set hlsearch			" Highlight search matches
set ignorecase			" Ignore case in searches
set smartcase			" Respect case when capital letters present
set backspace=indent,eol,start	" Allow backspace over new lines
set ruler			" Display cursor position on last line of screen
set visualbell			" Use visual bell instead of beeping
set mouse=a			" Enable mouse use in all modes
set autowrite			" Save the file when we switch buffers

let mapleader=","
inoremap jk <ESC>		" Map jk to ESC
nnoremap <leader>e :NERDTreeToggle<CR>

" =========================
" Neocomplete
" =========================
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" =========================
" End Neocomplete
" =========================
" =========================
" vim-go
" =========================

" Leader keys
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Jump between quickfix
au FileType go map <C-n> :cnext<CR>
au FileType go map <C-m> :cprevious<CR>
au FileType go nnoremap <leader>a :cclose<CR>

" Highlighting
let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
" =========================
" End vim-go
" =========================
