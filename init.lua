vim.g.skip_ts_context_commentstring_module = true

 require('nvim-treesitter.configs').setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

require("franksodre")
-- require("themes")

