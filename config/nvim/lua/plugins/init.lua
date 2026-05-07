return {
  -- File explorer
  { 'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        view_options = {
          show_hidden = true,
        },
      })

      vim.keymap.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open Oil (current dir)' })

      -- Familiar ex-command aliases
      vim.api.nvim_create_user_command('Ex',  'Oil',        {})
      vim.api.nvim_create_user_command('Sex', 'split|Oil',  {})
      vim.api.nvim_create_user_command('Vex', 'vsplit|Oil', {})
    end,
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- Lazy loading is not recommended because it is very tricky to make it
    -- work correctly in all situations.
    lazy = false,
  },

  -- tpope essentials
  'tpope/vim-abolish',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',

  -- Go
  { 'fatih/vim-go',
    build = ':GoUpdateBinaries',
    ft = 'go',                        -- lazy load on Go filetypes only
  },

  -- Rust
  { 'mrcjkb/rustaceanvim',
    ft = 'rust',                      -- lazy load on Rust filetypes only
  },
  
  -- Git
  'lewis6991/gitsigns.nvim',

  -- Diagnostics
  { "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- Testing
  'vim-test/vim-test',

  -- Focus/zen mode
  { 'folke/zen-mode.nvim',
    dependencies = { 'folke/twilight.nvim' },
    opts = {},
  },

  -- Alignment
  { 'junegunn/vim-easy-align',
    keys = {
      { 'ga', '<Plug>(EasyAlign)', mode = 'x', desc = 'EasyAlign (visual)' },
      { 'ga', '<Plug>(EasyAlign)', mode = 'n', desc = 'EasyAlign (motion)' },
    },
  },

  -- ASCII diagrams
  'jbyuki/venn.nvim',

  -- AI completion
  'github/copilot.vim',

  { "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
