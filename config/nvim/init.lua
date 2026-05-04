-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Use the spacebar as the leader. It's easily accesible from either hand.
-- Leader keys must be set before plugins are loaded
vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- Clipboard & UI behavior
vim.opt.clipboard  = 'unnamedplus'
vim.opt.visualbell = true
vim.opt.mouse      = 'a'
vim.opt.autowrite  = true

-- Display
vim.opt.number      = true
vim.opt.cursorline  = true
vim.opt.colorcolumn = { 80, '+0' }
vim.opt.scrolloff   = 3
vim.opt.linebreak   = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase  = true
vim.opt.showmatch  = true

-- Indentation
vim.opt.tabstop    = 2
vim.opt.shiftwidth = 0            -- Inherits tabstop value when 0
vim.opt.expandtab  = true

-- Escape insert mode
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })

-- Escape terminal mode
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Navigate splits
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left split' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to down split' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to up split' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right split' })

-- Resize splits
vim.keymap.set('n', '<Leader>+', ':resize +2<CR>',          { desc = 'Increase split height' })
vim.keymap.set('n', '<Leader>-', ':resize -2<CR>',           { desc = 'Decrease split height' })
vim.keymap.set('n', '<Leader>>', ':vertical resize +2<CR>',  { desc = 'Increase split width' })
vim.keymap.set('n', '<Leader><', ':vertical resize -2<CR>',  { desc = 'Decrease split width' })
vim.api.nvim_create_autocmd('VimResized', {
  callback = function() vim.cmd('wincmd =') end,
  desc     = 'Auto-equalize splits on terminal resize'
})

-- Expand %% to current buffer's directory on the command line
-- From Practical Vim by Drew Neil
vim.keymap.set('c', '%%', function()
  if vim.fn.getcmdtype() == ':' then
    return vim.fn.expand('%:h') .. '/'
  else
    return '%%'
  end
end, { expr = true, desc = 'Expand %% to buffer directory' })

-- Open Neovim config directory in a split
vim.keymap.set('n', '<Leader>ev', ':split ' .. vim.fn.stdpath('config') .. '<CR>', { desc = 'Open config directory' })

-- When text is wrapped, move up and down visually, unless a count is given.
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = 'Move down (visual line aware)' })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = 'Move up (visual line aware)' })

-- Abbreviations for common spelling errors.
vim.cmd('iabbrev fro for')
vim.cmd('iabbrev teh the')
vim.cmd('iabbrev tihs this')

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "default" } },
  checker = { enabled = true },
})
