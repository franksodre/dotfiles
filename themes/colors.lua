function SetColorScheme(color, isDark)
  color = color or "vague"
  vim.cmd.colorscheme(color)
  -- vim.cmd("colorscheme rose-pine-main")

  if isDark then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
end

SetColorScheme()
