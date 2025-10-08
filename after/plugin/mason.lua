require("mason").setup({
	ui = {
		border = "rounded",
	}
})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "gopls", "html", "jdtls", "cssls" },
  opts = {
    auto_install = true,
  }

})
