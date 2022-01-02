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

  use 'L3MON4D3/LuaSnip'
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
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- statusline
  use {'hoob3rt/lualine.nvim'}

  -- colorschemes
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'projekt0n/github-nvim-theme'

  use {'kyazdani42/nvim-web-devicons', opt = true}

  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'numToStr/Comment.nvim'

  -- DAP
  use "mfussenegger/nvim-dap"
  use "Pocco81/DAPInstall.nvim"
  use "rcarriga/nvim-dap-ui"
  use 'mfussenegger/nvim-dap-python'

  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup {
        context_offset = 100,
        load_autogroups = false,
        mappings_style = "sandwich",
        map_insert_mode = true,
        quotes = {"'", '"'},
        brackets = {"(", '{', '['},
        space_on_closing_char = false,
        pairs = {
          nestable = {{"(", ")"}, {"[", "]"}, {"{", "}"}},
          linear = {{"'", "'"}, {"`", "`"}, {'"', '"'}}
        },
        prefix = "s"
      }
    end
  }
end)
