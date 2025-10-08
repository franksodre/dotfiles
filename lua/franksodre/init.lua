require("franksodre.remap")
require("franksodre.set")
require("franksodre.yank_highlight")
require("franksodre.rename_nvim")

vim.o.updatetime = 250

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      border = "rounded",
      source = "always",
      prefix = " ",
  --  scope = "cursor",
    })
  end,
})
