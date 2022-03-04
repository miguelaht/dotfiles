vim.cmd [[packadd packer.nvim]]

-- compile packer when file is updated
vim.api.nvim_exec([[
  autocmd BufWritePost plugins.lua PackerCompile
]], true)

return require("packer").startup(function(use)
  use {"wbthomason/packer.nvim", opt = true}

  -- highlight
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
  }

  -- code completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"L3MON4D3/LuaSnip"},
      {"saadparwaiz1/cmp_luasnip"}
    }
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-telescope/telescope-fzy-native.nvim"}
    }
  }

  use { "ellisonleao/gruvbox.nvim", config = function ()
    vim.cmd("colorscheme gruvbox")
  end
  }

  use "kyazdani42/nvim-web-devicons"

  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  use "akinsho/toggleterm.nvim"

  use({
    "mvllow/modes.nvim",
    event = "BufRead", -- optional lazy loading
    config = function()
      vim.opt.cursorline = true
      require("modes").setup({
        focus_only = true,
        set_cursor = true,
      })
    end
  })
end)
