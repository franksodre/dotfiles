local function open_note()
  local buf = vim.api.nvim_create_buf(false, true)

  local width, height = 40, 5
  local opts = {
    relative = "cursor",
    row = 1,
    col = 0,
    width = width,
    height = height,
    style = "minimal",
    border = "solid",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "type something" })

  vim.keymap.set("n", "<Esc>", function()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    print("Note saved: " .. table.concat(lines, " "))
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf })
end

vim.api.nvim_create_user_command("Note", open_note, {})

-- make persistent
