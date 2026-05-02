-- Bootstrap packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP & Completion
  use {
    'neovim/nvim-lspconfig',
  }
  -- coc
  use  {
    'neoclide/coc.nvim',
    branch = 'release'
  }
  -- use { "RedsXDD/neopywal.nvim", as = "neopywal" }
  -- use {
  --   'hrsh7th/nvim-cmp',
  --   requires = {
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-path',
  --     'L3MON4D3/LuaSnip',
  --   }
  -- }
  use {
    'nvimtools/none-ls.nvim',
    requires = { 'nvimtools/none-ls-extras.nvim' }
  }

  -- oil.nvim
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = "master",
    build = ":TSUpdate",
  }

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Navigation & Editing
  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'
  use 'airblade/vim-rooter'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Git
  use 'tpope/vim-fugitive'

  -- UI & Themes
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  
  -- Colorschemes
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    -- config = function()
    --   vim.cmd.colorscheme('catppuccin-mocha')
    -- end
  }
  -- themes
  use 'rose-pine/neovim'
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'vague2k/vague.nvim'
  use {
   'metalelf0/base16-black-metal-scheme',
   as = 'base16',
   config = function()
     vim.cmd.colorscheme('base16-black-metal-immortal')
   end
  }
  use 'stevedylandev/darkmatter-nvim'
  use 'romanaverin/charleston.nvim'
  use 'ayu-theme/ayu-vim'
  use 'datsfilipe/vesper.nvim'

  -- Lua development
  use {
    'folke/lazydev.nvim',
    ft = 'lua'
  }

  -- Mini modules
  use {
    'echasnovski/mini.nvim',
    config = function()
      -- Mini.pick - Fuzzy picker
      require('mini.pick').setup()
      
      -- Mini.surround - Surround actions
      require('mini.surround').setup({
        mappings = {
          add = 'sa',            -- Add surrounding in Normal and Visual modes
          delete = 'sd',         -- Delete surrounding
          find = 'sf',           -- Find surrounding (to the right)
          find_left = 'sF',      -- Find surrounding (to the left)
          highlight = 'sh',      -- Highlight surrounding
          replace = 'sr',        -- Replace surrounding
          update_n_lines = 'sn', -- Update `n_lines`
        },
      })
    end
  }

  -- Fun
  use 'ThePrimeagen/vim-be-good'

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
