local navic = require("nvim-navic")

local filename = {
  'filename',
  symbols = {
    modified = '●',
    readonly = '🔒',
    unnamed = '[No Name]',
    newfile = '[New]',
  }
}

require('lualine').setup({
  options = {
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {filename},
    lualine_c = {'diff', 'diagnostics'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  winbar = {
    lualine_a = {},
    lualine_b = {filename},
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    },
    lualine_x = {'branch'},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    'fugitive',
    'nvim-tree',
    'quickfix',
    'symbols-outline',
  },
})
