return {
  { 'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      { '<Leader>ff',  desc = 'Find files' },
      { '<Leader>fo',  '<Cmd>Telescope oldfiles<CR>',                    desc = 'Recent files' },
      { '<Leader>fg',  '<Cmd>Telescope live_grep<CR>',                   desc = 'Live grep' },
      { '<Leader>fb',  '<Cmd>Telescope buffers<CR>',                     desc = 'Buffers' },
      { '<Leader>fh',  '<Cmd>Telescope help_tags<CR>',                   desc = 'Help tags' },
      { '<Leader>fds', '<Cmd>Telescope lsp_document_symbols<CR>',        desc = 'Document symbols' },
      { '<Leader>fs',  '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Workspace symbols' },
      { '<Leader>ft',  '<Cmd>Telescope treesitter<CR>',                  desc = 'Treesitter symbols' },
    },
    config = function()
      local telescope = require('telescope')
      local builtin   = require('telescope.builtin')

      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob=!.git',
          },
        },
      })

      telescope.load_extension('fzf')

      -- find_files needs a function call with custom args so it's defined here
      -- rather than as a simple string mapping in the keys block above
      vim.keymap.set('n', '<Leader>ff', function()
        builtin.find_files({
          find_command = {
            'fd',
            '--hidden',
            '--follow',
            '--exclude=.git',
          },
        })
      end, { desc = 'Find files' })
    end,
  },
}
