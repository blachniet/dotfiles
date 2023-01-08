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
  Plug 'junegunn/vim-easy-align'
  Plug 'lewis6991/gitsigns.nvim'

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

colorscheme nightfox

" Use the spacebar as the leader. It's easily accessible from either hand.
let g:mapleader=' '
let g:maplocalleader=' '

" General settings
set clipboard+=unnamedplus " Use the system clipbard
set visualbell             " Use visual bell instead of beeping
set mouse=a                " Enable mouse use in all modes
set autowrite              " Save the file when we switch buffers
set nonumber               " Hide line numbers
set colorcolumn=80,100,+0  " Column guides
set ignorecase             " Ignore case in searches
set smartcase              " Respect case when capital letters present
set showmatch              " Jump to matching bracket on insert
set scrolloff=3            " Keep lines above/below cursor when scrolling
set smartindent            " Indent logic for C-like programs
set tabstop=2
set shiftwidth=0           " When 0, use tabstop value
set expandtab
set termguicolors

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

" Resize with arrows. <https://github.com/jessarcher/dotfiles>
nnoremap <A-Up> :resize +2<CR>
nnoremap <A-Down> :resize -2<CR>
nnoremap <A-Left> :vertical resize -2<CR>
nnoremap <A-Right> :vertical resize +2<CR>

" Navigate the quickfix list.
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Open FZF.
nnoremap <C-p> :FZF<CR>

" Edit and source $MYVIMRC.
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" When text is wrapped, move up and down visually, unless a count is given.
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

" Convert the current word to uppercase in insert mode.
" https://learnvimscriptthehardway.stevelosh.com/chapters/04.html
inoremap <C-u> <Esc>viwUea

" Abbreviations for common spelling errors.
iabbrev fro for
iabbrev teh the
iabbrev tihs this

" ========================================
" Plugin Configuration
" ========================================

" Use ripgrep with ack.vim.
let g:ackprg='rg --hidden --smart-case --vimgrep'
nnoremap <Leader>/ :Ack!<Space>

" Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_toc_autofit=1
let g:vim_markdown_conceal_code_blocks=0

lua require('nvim-tree').setup { view = { side = 'right' }}
nnoremap <Leader>b <Cmd>NvimTreeToggle<CR>
nnoremap <Leader>B <Cmd>NvimTreeFindFile<CR>

lua <<EOF
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
EOF

lua <<EOF
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

require('symbols-outline').setup()
vim.keymap.set('n', '<leader>so', ':SymbolsOutline<cr>')

require('trouble').setup()
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true})
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true})
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true})
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true})
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true})

require('feline').setup()
require('feline').winbar.setup()

require('plugins/completion')
EOF
