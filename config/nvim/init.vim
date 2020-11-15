" vim-plug
" https://github.com/junegunn/vim-plug
" Common commands: PlugInstall, PlugUpdate, PlugClean
call plug#begin(stdpath('data') . 'plugged')
	Plug 'editorconfig/editorconfig-vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'mileszs/ack.vim'
	Plug 'preservim/nerdtree'
call plug#end()

set ignorecase		" Ignore case in searches
set smartcase		" Respect case when capital letters present
set visualbell		" Use visual bell instead of beeping
set mouse=a		" Enable mouse use in all modes
set autowrite		" Save the file when we switch buffers
set number		" Show line numbers
set colorcolumn=80,100	" Column guides
hi ColorColumn ctermbg=darkgrey guibg=darkgrey

let mapleader = ","
inoremap jk <ESC>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTree
let g:NERDTreeWinPos = "right"

" The Silver Searcher + ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

