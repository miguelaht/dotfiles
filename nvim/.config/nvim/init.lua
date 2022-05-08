vim.cmd [[packadd packer.nvim]]
local home = os.getenv('HOME')

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'PackerCompile', group = packer_group, pattern = 'init.lua' })

-- PACKER
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'neovim/nvim-lspconfig'
    use 'L3MON4D3/LuaSnip'
    use 'numToStr/Comment.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'ellisonleao/gruvbox.nvim'
    use 'projekt0n/github-nvim-theme'

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
end)
-- PACKER

-- COLORS
require('github-theme').setup({
    overrides = function()
        return {
            sidebars = { "telescope" },
            Visual = { style = 'inverse' },
            Search = { style = 'inverse' },
        }
    end,
})
-- vim.cmd('colorscheme gruvbox')
-- COLORS ]]

-- CONFIG
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.syntax = 'on'
vim.opt.colorcolumn = '80'
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = { home .. '/.vim/undodir' }
vim.opt.wrap = false
vim.opt.fileencoding = 'utf-8'
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.mouse = 'a'
vim.opt.updatetime = 50
vim.opt.ruler = false
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.opt.cursorline = true
-- CONFIG

-- KEYMAPS
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]], { noremap = true })
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]], { noremap = true })
vim.keymap.set('n', '<Leader><Leader>', '<c-^>', { silent = true, noremap = true })
vim.keymap.set('n', 'Q', '<Cmd>:q<CR>', { silent = true, noremap = true })
vim.keymap.set('i', '<A-p>', [[<C-r>"]], { silent = true, noremap = true })
vim.keymap.set('t', '<Esc>', [[<C-\><C-N>]])
vim.keymap.set('n', '[c', ':cp<CR>', { silent = true, noremap = true })
vim.keymap.set('n', ']c', ':cn<CR>', { silent = true, noremap = true })
vim.keymap.set('i', '<C-c>', '<C-x><C-o>', { noremap = true })
-- KEYMAPS

-- TREESITTER
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'c_sharp',
        'css',
        'go',
        'gomod',
        'html',
        'javascript',
        'json',
        'lua',
        'python',
        'rust',
        'prisma',
        'tsx',
        'typescript',
        'comment',
    },
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    incremental_selection = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { 'python' },
    },
}
-- TREESITTER

-- TELESCOPE
require('telescope').setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--hidden',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.80,
            height = 0.85,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules", ".git/", "dist/" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "absolute" },
        winblend = 0,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
    pickers = {
        hidden = false,
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case",
        },
    },
})
require('telescope').load_extension('fzf')
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files)
vim.keymap.set('n', '<Leader>pw', function()
    require('telescope.builtin').live_grep({ search = vim.fn.expand("<cword>") })
end)
vim.keymap.set('n', '<Leader>b', require('telescope.builtin').buffers)
-- TELESCOPE

-- LSP CONFIG
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

    vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, opts)
    vim.keymap.set('v', '<Leader>f', vim.lsp.buf.range_formatting, opts)
end

local handlers = {
    ['textDocument/hover'] = function(...)
        local bufnr, _ = vim.lsp.handlers.hover(...)
        if bufnr then
            vim.keymap.set('n', 'K', '<Cmd>wincmd p<CR>', { silent = true, buffer = bufnr })
        end
    end,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LANGUAGES
local servers = { 'tsserver', 'svelte', 'eslint', 'pyright', 'gopls', 'rust_analyzer', 'html', 'cssls' }

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers
    }
end

local pid = vim.fn.getpid()
local omnisharp_bin = home .. "/omnisharp-osx/run"
require 'lspconfig'.omnisharp.setup({
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers
})

require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
-- LSP CONFIG

-- NVIM-CMP
local luasnip = require('luasnip')
local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    snippet = {
        expand = function(args)
            if not luasnip then
                return
            end
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }),
})
-- NVIM-CMP

-- COMMENTS
require('Comment').setup({})
-- COMMENTS

vim.api.nvim_create_augroup('TrimOnSave', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'TrimOnSave',
    callback = function()
        local current_view = vim.fn.winsaveview()
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.fn.winrestview(current_view)
    end
})
