" vim-plug
" https://github.com/junegunn/vim-plug
" Common commands: PlugInstall, PlugUpdate, PlugClean
call plug#begin(stdpath('data') . 'plugged')
	Plug 'editorconfig/editorconfig-vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'mileszs/ack.vim'

	" File explorer
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'kyazdani42/nvim-tree.lua'

	" Markdown
	Plug 'godlygeek/tabular'
	Plug 'preservim/vim-markdown'

	" Discover more plugins here:
	" https://github.com/rockerBOO/awesome-neovim
call plug#end()

set visualbell          " Use visual bell instead of beeping
set mouse=a             " Enable mouse use in all modes
set autowrite           " Save the file when we switch buffers
set number              " Show line numbers
set colorcolumn=80,100  " Column guides
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" Use the system clipbard
set clipboard+=unnamedplus

" Search
set ignorecase  " Ignore case in searches
set smartcase   " Respect case when capital letters present

" Display
set showmatch
set scrolloff=3
set conceallevel=2

" Whitespace
set autoindent
set smartindent
set tabstop=2
set shiftwidth=0        " When 0, use tabstop value
set noexpandtab

let mapleader = ","
inoremap jk <ESC>
nnoremap <C-p> :FZF<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" The Silver Searcher + ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal_code_blocks = 0

" nvim-tree
nnoremap <Leader>e :NvimTreeToggle<CR>

lua << EOF
require'nvim-tree'.setup {
	open_on_tab = true,
	view = {
		side = 'right'
	}
}
EOF
