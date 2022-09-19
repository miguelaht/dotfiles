local colorscheme = "tokyonight"

vim.api.nvim_cmd({
    cmd = "packadd",
    args = { "packer.nvim" }
}, {})
local home = os.getenv("HOME")

local install_path = string.format("%s/site/pack/packer/start/packer.nvim", vim.fn.stdpath("data"))

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute(string.format("!git clone https://github.com/wbthomason/packer.nvim %s", install_path))
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { command = "PackerCompile", group = packer_group, pattern = "init.lua" })

require("packer").startup(function(use)
    use({ "wbthomason/packer.nvim" })

    use({ disable = false, "nvim-lua/plenary.nvim" })
    use({ disable = false, "ThePrimeagen/harpoon" })

    use({ disable = false, "neovim/nvim-lspconfig" })
    use({ disable = false, "hrsh7th/nvim-cmp" })
    use({ disable = false, "hrsh7th/cmp-nvim-lsp" })
    use({ disable = false, "L3MON4D3/LuaSnip" })
    use({ disable = false, "Issafalcon/lsp-overloads.nvim" })

    use({ disable = false, "williamboman/mason.nvim", config = function()
        require("mason").setup()
    end })

    use({ disable = false, "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ disable = false, "nvim-treesitter/nvim-treesitter-context" })

    use({ disable = true, "nanotech/jellybeans.vim" })
    use({ disable = true, "bluz71/vim-moonfly-colors" })
    use({ disable = true, "Mofiqul/adwaita.nvim" })
    use({ disable = false, "folke/tokyonight.nvim" })

    use({ disable = false, "mfussenegger/nvim-dap" })
    use({ disable = false, "rcarriga/nvim-dap-ui" })

    use({ disable = false, "vigoux/azy.nvim", run = "make lib" })
end)
-- PACKER

-- COLOR
if colorscheme == "adwaita" then
    vim.g.adwaita_darker = true
end

if colorscheme == "tokyonight" then
    require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
            sidebars = "transparent",
        },
    })
end

vim.api.nvim_cmd({
    cmd = "colorscheme",
    args = { colorscheme }
}, {})
-- COLOR

-- CONFIG
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.undofile = true
vim.opt.undodir = string.format("%s/.vim/undodir", home)
vim.opt.wrap = false
vim.opt.fileencoding = "utf-8"
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.cursorline = true
vim.opt.updatetime = 50
vim.opt.splitbelow = true
vim.opt.mouse = 'n'
vim.opt.isfname:append("@-@")
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.g.mapleader = " "
-- CONFIG

-- USER COMMANDS
vim.api.nvim_create_user_command("ConfigOpen", "e! $MYVIMRC", {})
vim.api.nvim_create_user_command("TmuxSend", [[silent exec "!tmux send-keys -t 1 '<args>' enter"]], { nargs = "+" })
-- USER COMMANDS

-- KEYMAPS
vim.keymap.set({ "n", "v" }, "<Up>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Down>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Left>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Right>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.keymap.set("i", "<A-p>", [[<C-r>"]])
vim.keymap.set("t", "<Esc>", [[<C-\><C-N>]])
vim.keymap.set("n", "<Leader><Leader>", "<c-^>")
vim.keymap.set("n", "[c", ":cp<CR>")
vim.keymap.set("n", "]c", ":cn<CR>")
vim.keymap.set("n", "<Leader>,", ":ConfigOpen<CR>")
vim.keymap.set("n", "<Leader>q", ":copen<CR>")
for var = 1, 9 do
    vim.keymap.set("n", string.format("<A-%d>", var), string.format("%dgt", var))
end
-- KEYMAPS

-- TREESITTER
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c_sharp",
        "css",
        "go",
        "gomod",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "rust",
        "tsx",
        "typescript",
        "comment",
    },
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true,
        disable = { "html" },
    },
    incremental_selection = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "python" },
        additional_vim_regex_highlighting = false,
    },
})
-- TREESITTER

-- HARPOON
require("harpoon").setup({
    global_settings = {
        enter_on_sendcmd = true,
    },
    menu = {
        borderchars = { "", "", "", "", "", "", "", "" }
    }
})

vim.keymap.set("n", "<Leader>m", require("harpoon.mark").add_file)
vim.keymap.set("n", "<Leader>h", require("harpoon.ui").toggle_quick_menu)
for var = 1, 4 do
    vim.keymap.set("n", string.format("<Leader>%d", var), function()
        require("harpoon.ui").nav_file(var)
    end)
end
-- HARPOON

-- LSP CONFIG
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<Leader>l", vim.diagnostic.setloclist, opts)

    vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, opts)
    vim.keymap.set("v", "<Leader>f", vim.lsp.buf.range_formatting, opts)

    if client.server_capabilities.signatureHelpProvider then
        require('lsp-overloads').setup(client, {
            ui = {
                -- The border to use for the signature popup window. Accepts same border values as |nvim_open_win()|.
                border = "single"
            },
            keymaps = {
                next_signature = "<C-j>",
                previous_signature = "<C-k>",
                next_parameter = "<C-l>",
                previous_parameter = "<C-h>",
            },
        })
    end
end

local handlers = {
    ["textDocument/hover"] = function(...)
        local bufnr, _ = vim.lsp.handlers.hover(...)
        if bufnr then
            vim.keymap.set("n", "K", "<Cmd>wincmd p<CR>", { buffer = bufnr })
        end
    end,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = false

-- LANGUAGES
local servers = {
    "tsserver",
    "rust_analyzer",
}

for _, lsp in pairs(servers) do
    require("lspconfig")[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers
    }
end

require("lspconfig").omnisharp.setup({
    cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/Omnisharp.dll" },
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
-- LSP CONFIG

-- NVIM-CMP
local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    completion = {
        autocomplete = true,
        completeopt = "menu,menuone,noinsert",
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-c>"] = cmp.mapping.complete(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
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
        { name = "nvim_lsp" },
    }),
})
-- NVIM-CMP

-- NVIM-DAP
local dap = require("dap")
local dapui = require("dapui")
dap.adapters.coreclr = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg",
    args = { "--interpreter=vscode" }
}

vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to your *proj file', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) ==
            1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end

    return vim.g['dotnet_last_dll_path']
end

local config = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
                vim.g.dotnet_build_project()
            end
            return vim.g.dotnet_get_dll_path()
        end,
    },
}

dap.configurations.cs = config

dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end

vim.keymap.set("n", "<Leader>sb", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>so", dap.step_out)
vim.keymap.set("n", "<Leader>si", dap.step_into)
vim.keymap.set("n", "<Leader>n", dap.continue)
-- NVIM-DAP

-- AZY
local ab = require 'azy.builtins'

vim.keymap.set("n", "<Leader>t", ab.files(vim.lsp.buf.list_workspace_folders()), {})
vim.keymap.set("n", "<Leader>p", ab.files_contents(), {})
vim.keymap.set('n', '<Leader>oc', ab.files { vim.fn.stdpath 'config' }, {})
-- AZY

-- AUTOCMD
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    pattern = "*",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.cs",
    command = "0r $HOME/.vim/skeletons/skeleton.cs"
})
-- AUTOCMD

-- CUSTOM TEXT OBJECTS
local chars = { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" }
for _, char in ipairs(chars) do
    for _, mode in ipairs({ "x", "o" }) do
        vim.api.nvim_set_keymap(mode, "i" .. char, string.format(":<C-u>normal! T%svt%s<CR>", char, char),
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap(mode, "a" .. char, string.format(":<C-u>normal! F%svf%s<CR>", char, char),
            { noremap = true, silent = true })
    end
end
-- CUSTOM TEXT OBJECTS
