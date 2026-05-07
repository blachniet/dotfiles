return {
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
  { 'lewis6991/gitsigns.nvim', opts = {} },

  -- Testing
  { 'vim-test/vim-test',
    keys = {
      { '<leader>tn', '<cmd>TestNearest<cr>', desc = 'Test Nearest' },
      { '<leader>tf', '<cmd>TestFile<cr>', desc = 'Test File' },
      { '<leader>ts', '<cmd>TestSuite<cr>', desc = 'Test Suite' },
      { '<leader>tl', '<cmd>TestLast<cr>', desc = 'Test Last' },
      { '<leader>tv', '<cmd>TestVisit<cr>', desc = 'Test Visit' },
    },
  },

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
  { 'jbyuki/venn.nvim',
    keys = {
      { '<leader>v', function()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd[[setlocal ve=all]]
          -- draw a line on HJKL keystokes
          vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
          -- draw a box by pressing "f" with visual selection
          vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
        else
          vim.api.nvim_buf_del_keymap(0, "n", "J")
          vim.api.nvim_buf_del_keymap(0, "n", "K")
          vim.api.nvim_buf_del_keymap(0, "n", "L")
          vim.api.nvim_buf_del_keymap(0, "n", "H")
          vim.api.nvim_buf_del_keymap(0, "v", "f")
          vim.cmd[[setlocal ve=]]
          vim.b.venn_enabled = nil
        end
      end, desc = 'Toggle Venn' },
    },
  },

  -- AI completion
  'github/copilot.vim',
}
