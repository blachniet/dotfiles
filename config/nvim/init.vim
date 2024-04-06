" vim:fileencoding=utf-8:foldmethod=marker:foldlevel=0

" vim-plug {{{1
call plug#begin(stdpath('data') . 'plugged')
  Plug 'editorconfig/editorconfig-vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'stevearc/oil.nvim'
  Plug 'godlygeek/tabular'            " Required by vim-markdown
  Plug 'preservim/vim-markdown'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'           " Git plugin
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'nvim-lua/plenary.nvim'        " Required by telescope.nvim
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Required by telescope.nvim
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'rust-lang/rust.vim'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'vim-test/vim-test'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'kassio/neoterm'
  Plug 'junegunn/vader.vim'
  Plug 'SmiteshP/nvim-navic'
  Plug 'jbyuki/venn.nvim'
  Plug 'github/copilot.vim'

  " Colorschemes
  Plug 'arcticicestudio/nord-vim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'sainnhe/everforest'

  " Completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  " Honorable mentions
  " mileszs/ack.vim - Using Telescope live_grep instead.
  " junegunn/fzf - Using Telescope find_file instead.
  " mattn/emmet-vim - I guess I've just never needed this that much.
  " Plug 'nvim-tree/nvim-web-devicons' " File explorer icons
  " Plug 'nvim-tree/nvim-tree.lua'     " File explorer

  if filereadable(stdpath('config') . '/plug.local.vim')
    execute 'source ' . stdpath('config') . '/plug.local.vim'
  endif

call plug#end()

" vim config {{{1

colorscheme kanagawa

" Use the spacebar as the leader. It's easily accessible from either hand.
let g:mapleader=' '
let g:maplocalleader=' '

" General settings
set clipboard+=unnamedplus " Use the system clipbard
set visualbell             " Use visual bell instead of beeping
set mouse=a                " Enable mouse use in all modes
set autowrite              " Save the file when we switch buffers
set number                 " Show line numbers
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
set linebreak

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

" Expand '%%' to the buffer's current directory, on the command line.
" From Practical Vim by Drew Neil.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

" Navigate the quickfix list.
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

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

" plugin config {{{1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Markdown
let g:vim_markdown_folding_disabled    = 1
let g:vim_markdown_toc_autofit         = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter         = 1
let g:vim_markdown_toml_frontmatter    = 1
let g:vim_markdown_json_frontmatter    = 1
let g:vim_markdown_strikethrough       = 1

" lua require('nvim-tree').setup { view = { side = 'right' }}
" nnoremap <Leader>b <Cmd>NvimTreeToggle<CR>
" nnoremap <Leader>B <Cmd>NvimTreeFindFile<CR>

" folke/trouble.nvim
nnoremap <Leader>xx <Cmd>TroubleToggle<CR>
nnoremap <Leader>xw <Cmd>TroubleToggle workspace_diagnostics<CR>
nnoremap <Leader>xd <Cmd>TroubleToggle document_diagnostics<CR>
nnoremap <Leader>xq <Cmd>TroubleToggle quickfix<CR>
nnoremap <Leader>xl <Cmd>TroubleToggle loclist<CR>
nnoremap gR <Cmd>TroubleToggle lsp_references<CR>

" kassio/neoterm
nnoremap <Leader>tss <Cmd>TREPLSendLine<CR>
vnoremap <Leader>ts  <Cmd>TREPLSendSelection<CR>

" simrat39/symbols-outline.nvim
lua require('symbols-outline').setup()
nnoremap <Leader>so :SymbolsOutline<CR>

" rust-lang/rust.vim
let g:rustfmt_autosave = 1

lua << EOF
  require('oil').setup({
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
    view_options = {
      show_hidden = true,
    }
  })
EOF
nnoremap - <Cmd>Oil<CR>
command Ex Oil
command Sex split|Oil
command Vex vsplit|Oil

" goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  lua require('lualine').hide()
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=3
  Limelight!
  lua require('lualine').hide({unhide=true})
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" lua plugin modules {{{1
lua require('plugins/cmp')
lua require('plugins/lspconfig')
lua require('plugins/rust-tools')
lua require('plugins/lualine')
lua require('plugins/kanagawa')
lua require('plugins/nvim-treesitter')

lua require('plugins/telescope')
nnoremap <Leader>fo  <Cmd>Telescope oldfiles<CR>
nnoremap <Leader>fg  <Cmd>Telescope live_grep<CR>
nnoremap <Leader>fb  <Cmd>Telescope buffers<CR>
nnoremap <Leader>fh  <Cmd>Telescope help_tags<CR>
nnoremap <Leader>fds <Cmd>Telescope lsp_document_symbols<CR>
nnoremap <Leader>fs  <Cmd>Telescope lsp_dynamic_workspace_symbols<CR>
nnoremap <Leader>ft  <Cmd>Telescope treesitter<CR>

" local config {{{1
if filereadable(stdpath('config') . '/init.local.vim')
  execute 'source ' . stdpath('config') . '/init.local.vim'
endif
