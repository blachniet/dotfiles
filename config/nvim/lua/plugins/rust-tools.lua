local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<space>ca", rt.code_action_group.code_action_group, { buffer = bufnr })

      -- Adpated from my nvim-lspconfig mappings.
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    end,
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
          extraArgs = { "--all", "--", "--warn", "clippy::all" },
        }
      }
    }
  },
})
