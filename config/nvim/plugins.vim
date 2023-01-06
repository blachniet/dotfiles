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
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-commentary'
	Plug 'EdenEast/nightfox.nvim'
	Plug 'nvim-lua/plenary.nvim'        " Required by telescope.nvim
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Required by telescope.nvim
	Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
	Plug 'mattn/emmet-vim'
	Plug 'rust-lang/rust.vim'
	Plug 'simrat39/rust-tools.nvim'
	Plug 'simrat39/symbols-outline.nvim'
	" Plug 'junegunn/vim-peekaboo'        " 👀 " / @ / CTRL-R
	Plug 'folke/trouble.nvim'
	Plug 'vim-test/vim-test'
	Plug 'rafamadriz/friendly-snippets'
	Plug 'feline-nvim/feline.nvim'

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

