" Use the spacebar as the leader. It's easily accessible from either hand.
let g:mapleader=' '
let g:maplocalleader=' '

" Neovim defaults
set nocompatible           " Always implied by having a vimrc, but explicit
filetype plugin indent on
syntax on
set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set display=lastline
set encoding=utf-8
set formatoptions=tcqj
set history=10000
set hlsearch
set incsearch
set laststatus=2
set nojoinspaces
set ruler
set sessionoptions-=options
set showcmd
set sidescroll=1
set smarttab
set ttyfast
set wildmenu
set wildoptions=pum,tagfile " Approximate Neovim default (Vim 8.2+)

" General settings
set clipboard+=unnamedplus " Use the system clipbard
set visualbell             " Use visual bell instead of beeping
set mouse=a                " Enable mouse use in all modes
set autowrite              " Save the file when we switch buffers
set number                 " Show line numbers
set cursorline
set colorcolumn=80,+0      " Column guides
set ignorecase             " Ignore case in searches
set smartcase              " Respect case when capital letters present
set showmatch              " Jump to matching bracket on insert
set scrolloff=3            " Keep lines above/below cursor when scrolling
set smartindent            " Indent logic for C-like programs
set tabstop=2
set shiftwidth=0           " When 0, use tabstop value
set expandtab
set linebreak

if has('termguicolors')
  set termguicolors
endif

colorscheme habamax

" Escape insert mode.
inoremap jk <Esc>

" Escape terminal-mode.
tnoremap jk <C-\><C-n>

" Open autocomplete.
inoremap <C-Space> <C-x><C-o>

" Navigate windows with Ctrl+j/k/l/h.
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Resize splits
nnoremap <Leader>+ :resize +2<CR>
nnoremap <Leader>- :resize -2<CR>
nnoremap <Leader>> :vertical resize +2<CR>
nnoremap <Leader>< :vertical resize -2<CR>
autocmd VimResized * wincmd =

" Expand '%%' to the buffer's current directory, on the command line.
" From Practical Vim by Drew Neil.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

" Navigate the quickfix list.
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" When text is wrapped, move up and down visually, unless a count is given.
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

" Abbreviations for common spelling errors.
iabbrev fro for
iabbrev teh the
iabbrev tihs this

nnoremap - <Cmd>Ex<CR>

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
