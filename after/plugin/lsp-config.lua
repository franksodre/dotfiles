local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local capabilities = require('blink.cmp').get_lsp_capabilities()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

require("lspconfig").lua_ls.setup ({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    }
  }

})

require("lspconfig").ts_ls.setup ({
  capabilities = capabilities
})

require("lspconfig").clangd.setup ({
  capabilities = capabilities
})

require("lspconfig").gopls.setup ({
  capabilities = capabilities
})

require("lspconfig").pyright.setup ({
  capabilities = capabilities
})

require("lspconfig").html.setup ({
  capabilities = capabilities
})

require("lspconfig").cssls.setup ({
  capabilities = capabilities
})

require("lspconfig").jdtls.setup ({
  capabilities = capabilities
})

require("lspconfig")['v_analyzer'].setup ({
  capabilities = capabilities
})

require("lspconfig")['ols'].setup ({
  capabilities = capabilities
})


-- keymaps
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
