vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}

    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    use {'tjdevries/nlua.nvim', opt = true}
    use {'tjdevries/lsp_extensions.nvim', opt = true}

    -- fzf
    use {
        'junegunn/fzf',
        run = function()
            vim.fn['fzf#install']()
        end,
        opt = true
    }
    use {'junegunn/fzf.vim', opt = true}

    -- highlight
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', require'nvim-treesitter.configs'.setup {highlight = {enable = true}}}

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}
    }

    -- colorschemes
    -- use 'eddyekofo94/gruvbox-flat.nvim'
    -- use 'ntk148v/vim-horizon' 
    -- use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
    -- use 'shaunsingh/nord.nvim'
    use 'gruvbox-community/gruvbox'

    -- git
    use {'TimUntersberger/neogit', requires = {'sindrets/diffview.nvim', 'nvim-lua/plenary.nvim'}}

    -- statusline
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

    -- smooth scroll
    -- use {'karb94/neoscroll.nvim', require('neoscroll').setup {}}

    use "natebosch/vim-lsc"
end)
