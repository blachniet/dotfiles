return {
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
}
