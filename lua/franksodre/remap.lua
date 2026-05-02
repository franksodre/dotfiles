vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>q", vim.cmd.Lex)

-- vim.cmd([[highlight StatusLine guibg=NONE]]) -- it's not working

vim.keymap.set("n", "<leader>l", '<Cmd>winc l<Cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", '<Cmd>winc h<Cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", '<Cmd>winc j<Cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", '<Cmd>winc k<Cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sp", vim.cmd.sp)
vim.keymap.set("n", "<leader>vp", vim.cmd.vsp)

vim.keymap.set("n", "<leader>q", '<Cmd>:Oil<Cr>', { noremap = true, silent = true })

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

-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set('i', '<Tab>', [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<Tab>" : coc#refresh()]], opts)
vim.keymap.set('i', '<S-Tab>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Enter to confirm completion  
vim.api.nvim_create_autocmd('User', {
  pattern = 'CocNvimInit',
  callback = function()
    vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {
      silent = true, noremap = true, expr = true, replace_keycodes = false
    })
  end
})

-- C-n/C-p for navigation (alternative to up/down)  
vim.keymap.set('i', '<C-n>', [[coc#pum#visible() ? coc#pum#next(0) : "\<C-n>"]], opts)
vim.keymap.set('i', '<C-p>', [[coc#pum#visible() ? coc#pum#prev(0) : "\<C-p>"]], opts)

-- Helper function for Tab behavior  
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

vim.keymap.set("n", "gd", "<Plug>(coc-definition)")
vim.keymap.set("n", "gr", "<Plug>(coc-references)")
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)")
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)")
-- vim.keymap.set("n", "gk", "<Plug>(coc-hover)")
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)")

function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

vim.keymap.set('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })
vim.keymap.set('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', {silent = true, nowait = true, expr = true})
vim.keymap.set('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', {silent = true, nowait = true, expr = true})
