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

  -- statusline
  use {'hoob3rt/lualine.nvim'}

  -- colorschemes
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'projekt0n/github-nvim-theme'

  use {'kyazdani42/nvim-web-devicons', opt = true}


  -- refactor
  use {
    'ThePrimeagen/refactoring.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-treesitter/nvim-treesitter'}
    }
  }


  use {'karb94/neoscroll.nvim'}

  use { 'michaelb/sniprun', run = 'bash ./install.sh'}

  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
end)
