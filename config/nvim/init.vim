" ========================================
" General settings
" ========================================
set clipboard+=unnamedplus " Use the system clipbard
set visualbell          " Use visual bell instead of beeping
set mouse=a             " Enable mouse use in all modes
set autowrite           " Save the file when we switch buffers
set number              " Show line numbers
set colorcolumn=80,100  " Column guides
set ignorecase          " Ignore case in searches
set smartcase           " Respect case when capital letters present
set showmatch           " Jump to matching bracket on insert
set scrolloff=3         " Keep lines above/below cursor when scrolling
set autoindent          " Copy indent from current line to new line
set smartindent         " Indent logic for C-like programs
set tabstop=2
set shiftwidth=0        " When 0, use tabstop value
set noexpandtab
set termguicolors

" ========================================
" Key mappings
" ========================================
let mapleader = ","
inoremap jk <ESC>
inoremap <C-Space> <C-x><C-o>
nnoremap <C-p> :FZF<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" ========================================
" Plugins
"
" vim-plug
" https://github.com/junegunn/vim-plug
" Common commands: PlugInstall, PlugUpdate, PlugClean
"
" Discover more plugins here:
" https://github.com/rockerBOO/awesome-neovim
" ========================================
call plug#begin(stdpath('data') . 'plugged')
	Plug 'editorconfig/editorconfig-vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'mileszs/ack.vim'
	Plug 'kyazdani42/nvim-web-devicons' " File explorer icons
	Plug 'kyazdani42/nvim-tree.lua'     " File explorer
	Plug 'godlygeek/tabular'            " Required by vim-markdown
	Plug 'preservim/vim-markdown'
	Plug 'arcticicestudio/nord-vim'     " Nord color scheme
	Plug 'tpope/vim-fugitive'           " Git plugin
	Plug 'EdenEast/nightfox.nvim'
	Plug 'nvim-lualine/lualine.nvim'    " Statusline
	Plug 'nvim-lua/plenary.nvim'        " Required by telescope.nvim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Required by telescope.nvim
	Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

	" Completion
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

call plug#end()

" ========================================
" Plugin settings
" ========================================
colorscheme nightfox

" ack.vim + ripgrep
let g:ackprg = 'rg --hidden --smart-case --vimgrep'
nnoremap <Leader>/ :Ack!<Space>

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal_code_blocks = 0

" nvim-tree
nnoremap <Leader>e :NvimTreeToggle<CR>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua << EOF
require'nvim-tree'.setup {
	view = {
		side = 'right'
	}
}
require('lualine').setup()
require('plugins/completion')
EOF
