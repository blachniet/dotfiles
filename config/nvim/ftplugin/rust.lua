local bufopts = { silent=true, buffer=true }

vim.keymap.set('n', '<localleader>cb', '<cmd>Cbuild<cr>G', bufopts)
vim.keymap.set('n', '<localleader>crr', '<cmd>Crun<cr>G', bufopts)
vim.keymap.set('n', '<localleader>crt', '<cmd>Cruntarget<cr>G', bufopts)
vim.keymap.set('n', '<localleader>rta', '<cmd>RustTest!<cr>G', bufopts)
vim.keymap.set('n', '<localleader>rtc', '<cmd>RustTest<cr>G', bufopts)
vim.keymap.set('n', 'ged', '<cmd>RustOpenExternalDocs', bufopts)

