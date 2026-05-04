return {
  { 'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'SmiteshP/nvim-navic',
    },
    config = function()
      local navic = require('nvim-navic')

      local filename = {
        'filename',
        symbols = {
          modified = '●',
          readonly = '🔒',
          unnamed  = '[No Name]',
          newfile  = '[New]',
        },
      }

      -- Only show encoding when it's not utf-8
      local encoding = {
        'encoding',
        cond = function()
          return vim.opt.fileencoding:get() ~= 'utf-8'
        end,
      }

      -- Only show fileformat when it's not unix
      local fileformat = {
        'fileformat',
        cond = function()
          return vim.bo.fileformat ~= 'unix'
        end,
      }

      require('lualine').setup({
        options = {
          section_separators   = '',
          component_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { filename },
          lualine_c = { 'diff', 'diagnostics' },
          lualine_x = { encoding, fileformat, 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        winbar = {
          lualine_a = {},
          lualine_b = { filename },
          lualine_c = {
            {
              'navic',
              color_correction = nil,
              navic_opts        = nil,
            },
          },
          lualine_x = { 'branch' },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {
          'fugitive',
          'oil',
          'quickfix',
        },
      })
    end,
  },
}
