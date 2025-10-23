vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

vim.keymap.set("n", "<leader>l", '<Cmd>winc l<Cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", '<Cmd>winc h<Cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", '<Cmd>winc j<Cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", '<Cmd>winc k<Cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sp", vim.cmd.sp)
vim.keymap.set("n", "<leader>vp", vim.cmd.vsp)

-- diagnostics map
vim.keymap.set("n", "<leader>g", vim.diagnostic.open_float, { desc = "show diagnostics"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Ji", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "N",  "Nzzzv")
vim.keymap.set("n", "n",  "nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>b", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- delete blank lines in selection

vim.keymap.set("v", "<leader>db", [[:g/^\s*$/d<CR>]], { desc = "delete blank lines in selection" })

-- quickfix list mappings
vim.keymap.set("n", "<M-j>", function ()
  vim.cmd("cnext")
end, { desc = "quickfix next"})

vim.keymap.set("n", "<M-k>", function ()
  vim.cmd("cprev")
end, { desc = "quickfix previous"})

vim.keymap.set("n", "<M-q>", function ()
  vim.cmd("cclose")
end, { desc = "quickfix next"})

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
