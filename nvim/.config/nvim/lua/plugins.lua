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

  -- colorschemes
  --[[ use { "projekt0n/github-nvim-theme", config = function ()
    require("github-theme").setup({
      theme_style = "dark",
      comment_style = "NONE",
      keyword_style = "NONE",
      function_style = "NONE",
      variable_style = "NONE",
      dark_float = true,
    })
  end
  } ]]

  use { "ellisonleao/gruvbox.nvim", config = function ()
    vim.cmd("colorscheme gruvbox")
  end
  }

  --[[ use({
    "rose-pine/neovim",
    as = "rose-pine",
    tag = "v1.*",
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon"
      })
      vim.cmd("colorscheme rose-pine")
    end
  }) ]]

  use "kyazdani42/nvim-web-devicons"

  -- status line
  --[[ use "nvim-lualine/lualine.nvim"
  use "arkav/lualine-lsp-progress" ]]

  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  use "akinsho/toggleterm.nvim"
  -- use { "nanotee/sqls.nvim", config = function() require("sqls").setup() end }

  use({
    "mvllow/modes.nvim",
    event = "BufRead", -- optional lazy loading
    config = function()
      vim.opt.cursorline = true
      require("modes").setup()
    end
  })
end)
