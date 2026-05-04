return {
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup({
        ensure_installed = {
          'bash',
          'go',
          'hcl',
          'lua',
          'markdown',
          'markdown_inline',
          'python',
          'rust',
          'terraform',
          'toml',
          'yaml',
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = '<CR>',
            node_incremental  = '<CR>',
            node_decremental  = '<BS>',
            scope_incremental = '<Tab>',
          },
        },
      })
    end,
  },
}
