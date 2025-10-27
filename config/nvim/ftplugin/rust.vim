nnoremap <LocalLeader>cb <Cmd>Cbuild<CR>G
nnoremap <LocalLeader>crr <Cmd>Crun<CR>G
nnoremap <LocalLeader>crt <Cmd>Cruntarget<CR>G
nnoremap <LocalLeader>rta <Cmd>RustTest!<CR>G
nnoremap <LocalLeader>rtc <Cmd>RustTest<CR>G

lua << EOF
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)
EOF
