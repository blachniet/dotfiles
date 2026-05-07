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
}
