" ========================================
" General settings
" ========================================
set clipboard+=unnamedplus " Use the system clipbard
set visualbell          " Use visual bell instead of beeping
set mouse=a             " Enable mouse use in all modes
set autowrite           " Save the file when we switch buffers
set nonumber            " Hide line numbers
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
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'EdenEast/nightfox.nvim'
	Plug 'nvim-lualine/lualine.nvim'    " Statusline
	Plug 'nvim-lua/plenary.nvim'        " Required by telescope.nvim
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Required by telescope.nvim
	Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
	Plug 'mattn/emmet-vim'
	Plug 'rust-lang/rust.vim'
	Plug 'simrat39/rust-tools.nvim'
	Plug 'junegunn/vim-peekaboo'        " 👀 " / @ / CTRL-R

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

lua << EOF

-- When text is wrapped, move up and down visually, unless a count is given.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- nvim-tree
require'nvim-tree'.setup {
	view = {
		side = 'right'
	}
}
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>E', ':NvimTreeFindFile<CR>',  { noremap = true, silent = true })

-- Telescope
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
			-- ☝️ Everything above this line matches the default for Telescope.
			'--hidden',     -- Include hidden files in searches.
			'--glob=!.git', -- Ignore the .git directory
    }
  }
}

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function()
		telescope_builtin.find_files({
			find_command = {
				'fd',
				'--hidden',       -- Show hidden files
				'--follow',       -- Follow symlinks
				'--exclude=.git', -- Exclude the .git folder.
			},
		})
	end, {
	desc = 'Telescope find_files'
})
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- Rust
vim.api.nvim_set_var('rustfmt_autosave', true)

local rt = require("rust-tools")
rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<space>ca", rt.code_action_group.code_action_group, { buffer = bufnr })

			-- Adpated from my nvim-lspconfig mappings.
			local bufopts = { noremap=true, silent=true, buffer=bufnr }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
			vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
		end,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy"
				}
			}
		}
	},
})

require('lualine').setup()
require('plugins/completion')
EOF
