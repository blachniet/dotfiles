local bufopts = { silent=true, buffer=true }

vim.keymap.set('n', '<leader>cb', '<cmd>Cbuild<cr>G', bufopts)
vim.keymap.set('n', '<leader>crr', '<cmd>Crun<cr>G', bufopts)
vim.keymap.set('n', '<leader>crt', '<cmd>Cruntarget<cr>G', bufopts)
vim.keymap.set('n', '<leader>rta', '<cmd>RustTest!<cr>G', bufopts)
vim.keymap.set('n', '<leader>rtc', '<cmd>RustTest<cr>G', bufopts)
vim.keymap.set('n', 'ged', '<cmd>RustOpenExternalDocs', bufopts)

