vim.g.skip_ts_context_commentstring_module = true

 require('nvim-treesitter.configs').setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

vim.lsp.config('lua', {
  -- cmd = { 'lua-language-server' },
  filetypes = {'lua'},
})

vim.lsp.config('golang', {
  filetypes = {'go'}
})

vim.lsp.config('html', {
  filetypes = {'html', 'jsx', 'tsx'}
})

vim.lsp.config('css', {
  filetypes = {'css'}
})

vim.lsp.config('odin', {
  filetypes = {'odin'}
})

vim.lsp.config('clangd', {
  filetypes = {'c'}
})

-- vim.lsp.config('vlang', {
--   filetypes = {'v'}
-- })

vim.lsp.config('typescript', {
  filetypes = {'ts', 'js'}
})

vim.lsp.config('emmet-language-server', {
  filetypes = {'html', 'css'}
})

require("franksodre")
-- require("themes")
