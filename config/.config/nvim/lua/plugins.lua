vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- highlight
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', require'nvim-treesitter.configs'.setup {highlight = {enable = true}}}

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'nvim-lua/lsp_extensions.nvim', opt = true}

  -- code completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip'
    }
  }

  -- fzf
  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']()
    end, opt = true
  }
  use { 'ibhagwan/fzf-lua',
  requires = {
    'vijaymarupudi/nvim-fzf'}
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}
  }

  use {'windwp/nvim-autopairs'}

  -- colorschemes
  use 'eddyekofo94/gruvbox-flat.nvim'

  -- statusline
  use {'hoob3rt/lualine.nvim'}

end)
