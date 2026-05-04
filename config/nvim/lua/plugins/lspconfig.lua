return {
  { 'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      'SmiteshP/nvim-navic',
    },
    config = function()
      -- rest of config unchanged ...
      local navic = require('nvim-navic')
      local map   = vim.keymap.set

      local on_attach = function(client, bufnr)
        -- Attach navic for breadcrumb support in lualine winbar
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end

        local opts = { silent = true, buffer = bufnr }

        -- Workspace
        map('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder,    vim.tbl_extend('force', opts, { desc = 'Add workspace folder' }))
        map('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, vim.tbl_extend('force', opts, { desc = 'Remove workspace folder' }))
        map('n', '<Leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, vim.tbl_extend('force', opts, { desc = 'List workspace folders' }))

        -- Actions
        map('n', '<Leader>D',  vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { desc = 'Type definition' }))
        map('n', '<Leader>rn', vim.lsp.buf.rename,          vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
        map('n', '<Leader>ca', vim.lsp.buf.code_action,     vim.tbl_extend('force', opts, { desc = 'Code action' }))
        map('n', '<Leader>fk', vim.lsp.buf.format,          vim.tbl_extend('force', opts, { desc = 'Format buffer' }))
      end

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Default config for all language servers
      vim.lsp.config('*', {
        capabilities = capabilities,
        on_attach    = on_attach,
      })

      -- rust-analyzer is managed by rustaceanvim -- do not include it here
      vim.lsp.enable({
        'eslint',
        'gopls',
        'marksman',
        'terraformls',
        'ts_ls',
      })

    end,
  },
}
