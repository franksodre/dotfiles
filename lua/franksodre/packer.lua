-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  -- lua/plugins/rose-pine.lua
  use({
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      -- vim.cmd("colorscheme rose-pine-main")
    end,
  })
  use({
    "vague2k/vague.nvim",
    config = function()
      vim.cmd("colorscheme vague")
    end
  })

  use({
    "metalelf0/base16-black-metal-scheme",
    config = function()
      -- vim.cmd("colorscheme base16-black-metal-bathory")
      -- avaiable theme tastes
      -- Bathory: Hammerheart
      -- Burzum: Filosofem
      -- Dark Funeral: The secrets of the black arts
      -- Gorgoroth: Twilight of the idols
      -- Immortal: At the heart of winter
      -- Khold: Phantom
      -- Marduk: Panzer Division Marduk
      -- Mayhem: Dawn of the black hearts
      -- Nile: Black seeds of vengeance
      -- Venom: Welcome to hell

    end,
    priority = 1000
  })

  use({
    "romanaverin/charleston.nvim"
  })

  use({
    "folke/tokyonight.nvim"
  })
  -- kanagawa theme
  use ("rebelot/kanagawa.nvim")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use({
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("datsfilipe/vesper.nvim")
	use("ayu-theme/ayu-vim")
	use({ "L3MON4D3/LuaSnip" })

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lsp")

  use("nvimtools/none-ls.nvim")
  use("nvimtools/none-ls-extras.nvim")
  --
  -- lua line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
  }
  -- comment strings
  use("numToStr/Comment.nvim")

  -- VimBeGood
  use ("ThePrimeagen/vim-be-good")
  --
  -- nvim auto-pairs
  use {
    "windwp/nvim-autopairs",
  }
  use ({
    'echasnovski/mini.nvim',
  })

end)
