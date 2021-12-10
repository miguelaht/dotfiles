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
    }
  }
  use {
    'L3MON4D3/LuaSnip',
    config = function() require('config.snippets') end,
  }

  use "rafamadriz/friendly-snippets"

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

  -- statusline
  use {'hoob3rt/lualine.nvim'}

  -- colorschemes
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'projekt0n/github-nvim-theme'

  use {'kyazdani42/nvim-web-devicons', opt = true}

  use {'karb94/neoscroll.nvim'}

  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- DAP
  use "mfussenegger/nvim-dap"
  use "Pocco81/DAPInstall.nvim"
  use "rcarriga/nvim-dap-ui"
  use 'mfussenegger/nvim-dap-python'
end)
