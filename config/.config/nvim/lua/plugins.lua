vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- highlight
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'nvim-lua/lsp_extensions.nvim', opt = true}

  -- code completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'saadparwaiz1/cmp_luasnip'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use 'rmagatti/auto-session'

  -- fzf
  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']()
    end, opt = true
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}
  }

  use {'windwp/nvim-autopairs'}

  -- statusline
  use {'hoob3rt/lualine.nvim'}

  -- colorschemes
  use 'eddyekofo94/gruvbox-flat.nvim'

  use {'kyazdani42/nvim-web-devicons', opt = true}


  -- refactor
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      {"nvim-lua/plenary.nvim"},
    }
  }

  use {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require('neoclip').setup({
        history = 1000,
        filter = nil,
        preview = true,
        default_register = '"',
        content_spec_column = false,
        on_paste = {
          set_reg = false,
        },
        keys = {
          i = {
            select = '<cr>',
            paste = '<c-p>',
            paste_behind = '<c-k>',
          },
          n = {
            select = '<cr>',
            paste = 'p',
            paste_behind = 'P',
          },
        },
      })
    end,
  }

end)
