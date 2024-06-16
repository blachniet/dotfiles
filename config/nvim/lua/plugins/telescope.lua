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

require('telescope').load_extension('fzf')