-- Put this in after/plugin/mini-pick.lua or in your keymaps file

local map = vim.keymap.set

-- Mini.pick keymaps
map('n', '<leader>mf', '<cmd>Pick files<cr>', { desc = 'Pick files' })
map('n', '<leader>mg', '<cmd>Pick grep_live<cr>', { desc = 'Pick grep live' })
map('n', '<leader>mb', '<cmd>Pick buffers<cr>', { desc = 'Pick buffers' })
map('n', '<leader>mh', '<cmd>Pick help<cr>', { desc = 'Pick help' })
map('n', '<leader>mr', '<cmd>Pick resume<cr>', { desc = 'Pick resume' })

-- Or if you want to use lua functions directly:
-- map('n', '<leader>pf', function() MiniPick.builtin.files() end, { desc = 'Pick files' })
-- map('n', '<leader>pg', function() MiniPick.builtin.grep_live() end, { desc = 'Pick grep live' })
-- map('n', '<leader>pb', function() MiniPick.builtin.buffers() end, { desc = 'Pick buffers' })
-- map('n', '<leader>ph', function() MiniPick.builtin.help() end, { desc = 'Pick help' })

-- Mini.surround usage examples:
-- saiw"  - Surround word with quotes
-- saiw)  - Surround word with parentheses
-- sd"    - Delete surrounding quotes
-- sr"'   - Replace surrounding quotes with single quotes
-- sf"    - Find next quote to the right
-- sh"    - Highlight text inside quotes
