local telescope = require('telescope').setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {},
})


local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fl', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>tk', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.live_grep({ search = vim.fn.input("Grep > ") });
end)
