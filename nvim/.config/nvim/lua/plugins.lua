vim.cmd [[packadd packer.nvim]]

-- compile packer when file is updated
vim.api.nvim_exec([[
  autocmd BufWritePost plugins.lua PackerCompile
]], true)

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- highlight
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- code completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-nvim-lsp'},
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'}
    }
  }

  -- colorschemes
  use 'projekt0n/github-nvim-theme'
  use 'kyazdani42/nvim-web-devicons'

  use 'numToStr/Comment.nvim'

  use {'akinsho/toggleterm.nvim'}
end)
