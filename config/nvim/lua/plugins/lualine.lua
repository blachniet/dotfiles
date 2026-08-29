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

      -- Avante's sidebar is made of several small unnamed scratch windows.
      -- Disable winbar on these to reduce clutter.
      local avante_filetypes = { 'Avante', 'AvanteInput', 'AvanteSelectedCode', 'AvanteSelectedFiles', 'AvanteTodos' }

      require('lualine').setup({
        options = {
          section_separators   = '',
          component_separators = '',
          disabled_filetypes = {
            winbar = avante_filetypes,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { filename },
          lualine_c = { 'branch', 'diff', 'diagnostics' },
          lualine_x = { encoding, fileformat, 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        winbar = {
          lualine_c = {
            {
              'navic',
              color_correction = nil,
              navic_opts        = nil,
              cond = function()
                return require('nvim-navic').is_available()
              end,
            },
          },
        },
        extensions = {
          'fugitive',
          'oil',
          'quickfix',
          'avante',
        },
      })
    end,
  },
}
