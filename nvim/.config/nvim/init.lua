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

    use({ "https://gitlab.com/schrieveslaach/sonarlint.nvim" })

    use({ disable = false, "nvim-lua/plenary.nvim" })
    use({
        disable = false,
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { "nvim-lua/plenary.nvim" }
    })

    use({ disable = false, "mfussenegger/nvim-jdtls" })
    use({ disable = false, "neovim/nvim-lspconfig" })
    use({ disable = false, "hrsh7th/nvim-cmp" })
    use({ disable = false, "hrsh7th/cmp-buffer" })
    use({ disable = false, "hrsh7th/cmp-nvim-lsp" })
    use({ disable = false, "L3MON4D3/LuaSnip" })
    use({ disable = false, "Issafalcon/lsp-overloads.nvim" })
    use({ disable = false, "hoffs/omnisharp-extended-lsp.nvim" })
    use({ disable = false, "Decodetalkers/csharpls-extended-lsp.nvim" })

    use({
        disable = false,
        "williamboman/mason.nvim",
        require = { "williamboman/mason-lspconfig.nvim", "mfussenegger/nvim-lint" },
        config = function()
            require("mason").setup()
        end
    })

    use({
        disable = false,
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    })
    use({
        disable = false,
        "mfussenegger/nvim-lint",
    })

    use({ disable = false, "tpope/vim-fugitive" })

    use({ disable = false, "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ disable = false, "nvim-treesitter/nvim-treesitter-context" })

    use({ disable = false, "adelarsq/neofsharp.vim" })
    use({ disable = true, "ellisonleao/gruvbox.nvim" })
    use({ disable = true, "nanotech/jellybeans.vim" })
    use({ disable = true, "EdenEast/nightfox.nvim" })
    use({ disable = false, "folke/tokyonight.nvim" })

    use({ disable = false, "mfussenegger/nvim-dap" })
    use({ disable = false, "rcarriga/nvim-dap-ui", requires = { "nvim-neotest/nvim-nio" } })

    use({ disable = false, "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ disable = false, "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })

    use({ disable = false, "mbbill/undotree" })
end)
-- PACKER

-- COLOR
if colorscheme == "gruvbox" then
    require("gruvbox").setup({
        inverse = false,   -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
    })
end

if colorscheme == "github-theme" then
    require("github-theme").setup({
        -- ...
    })
end

if colorscheme == "tokyonight" then
    require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
            sidebars = "transparent",
        },
        dim_inactive = true,
    })
end

vim.api.nvim_cmd({
    cmd = "colorscheme",
    args = { colorscheme }
}, {})
-- COLOR

-- CONFIG
vim.opt.foldnestmax = 1
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
vim.g.editorconfig = true
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_localmvdircmd = "-r"
vim.g.netrw_localrmdir = "rm -r"
vim.g.netrw_list_hide = [['\(^\|\s\s\)\zs\.\S\+']]
-- CONFIG

-- USER COMMANDS
vim.api.nvim_create_user_command("ConfigOpen", "e! $MYVIMRC", {})
vim.api.nvim_create_user_command("TmuxSend", [[silent exec "!tmux send-keys -t 1 '<args>' enter"]], { nargs = "+" })
vim.api.nvim_create_user_command("ClearBreakpoints", require("dap").clear_breakpoints, {})
-- USER COMMANDS

-- KEYMAPS
vim.keymap.set({ "n", "v" }, "<Up>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Down>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Left>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Right>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.keymap.set("i", "<A-p>", [[<C-r>"]])
vim.keymap.set("t", "<Esc>", [[<C-\><C-N>]]) -- terminal window
vim.keymap.set("n", "<Leader><Leader>", "<c-^>")
vim.keymap.set("n", "[q", ":cprevious<CR>")
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[l", ":lprevious<CR>")
vim.keymap.set("n", "]l", ":lnext<CR>")
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
        "json",
        "lua",
        "comment",
    },
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true,
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

-- TELESCOPE
require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--hidden",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
    },
    pickers = {
        buffers = {
            mappings = {
                n = {
                    ["<C-z>"] = require("telescope.actions").delete_buffer,
                },
                i = {
                    ["<C-z>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})
require("telescope").load_extension("fzf")
vim.keymap.set("n", "<c-t>", require("telescope.builtin").git_files)
vim.keymap.set("n", "<Leader>pw", function()
    require("telescope.builtin").live_grep({ search = vim.fn.expand("<cword>") })
end)
vim.keymap.set("n", "<Leader>b", require("telescope.builtin").buffers)
-- TELESCOPE

-- HARPOON
local harpoon = require("harpoon");
harpoon:setup()

vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
vim.keymap.set("n", "<Leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

for var = 1, 4 do
    vim.keymap.set("n", string.format("<Leader>%d", var), function()
        harpoon:list():select(var)
    end)
end
-- HARPOON

-- LSP CONFIG
local on_attach = function(client, bufnr)
    vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

    if client.name == 'omnisharp' then
        local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
        for i, v in ipairs(tokenModifiers) do
            tokenModifiers[i] = v:gsub(' ', '_')
        end
        local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
        for i, v in ipairs(tokenTypes) do
            tokenTypes[i] = v:gsub(' ', '_')
            tokenTypes[i] = tokenTypes[i]:gsub('-_', '')
        end
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<Leader>l", vim.diagnostic.setloclist, opts)

    vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)

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
            display_automatically = true
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

local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LANGUAGES
lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
})
lspconfig.svelte.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
})
lspconfig.ocamllsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
})

lspconfig.fsharp_language_server.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    cmd = { "fsautocomplete", "--adaptive-lsp-server-enabled" }
})

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro" },
                enableExperimental = true,
            }
        }
    }
}

--[[
require("lspconfig").csharp_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    root_dir = require("lspconfig.util").root_pattern('*.sln', '.git'),
    handlers = {
        ["textDocument/hover"] = function(...)
            local bufnr, _ = vim.lsp.handlers.hover(...)
            if bufnr then
                vim.keymap.set("n", "K", "<Cmd>wincmd p<CR>", { buffer = bufnr })
            end
        end,
        ["textDocument/definition"] = require('csharpls_extended').handler,
    }
}
]]
--

lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
})

--[[
lspconfig.java_language_server.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/packages/java-language-server/dist/lang_server_mac.sh" },
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
})
]]
--

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
})

lspconfig.harper_ls.setup({
    filetypes = { "cs" },
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
    root_dir = function(fname)
        return lspconfig.util.root_pattern '*.sln' (fname) or lspconfig.util.root_pattern '*.csproj' (fname)
    end,
})

lspconfig.omnisharp.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp" },
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
        ["textDocument/hover"] = function(...)
            local bufnr, _ = vim.lsp.handlers.hover(...)
            if bufnr then
                vim.keymap.set("n", "K", "<Cmd>wincmd p<CR>", { buffer = bufnr })
            end
        end,
        ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
        ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
        ["textDocument/references"] = require('omnisharp_extended').references_handler,
        ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
    },
    root_dir = function(fname)
        return lspconfig.util.root_pattern '*.sln' (fname) or lspconfig.util.root_pattern '*.csproj' (fname)
    end,
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    settings = {
        Lua = {
            hint = { enabled = true },
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
        { name = "buffer" },
    }),
})
-- NVIM-CMP

-- NVIM-DAP
local dap = require("dap")
local dapui = require("dapui")
dap.adapters.java = {
}
dap.adapters.coreclr = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg",
    args = { "--interpreter=vscode" }
}

local config = {
    {
        type = "coreclr",
        name = "attach - netcoredbg",
        request = "attach",
        processId = require("dap.utils").pick_process,
    },
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
    },
}

dap.configurations.cs = config

dap.configurations.java = {
    {
        type = 'java',
        request = 'attach',
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = function()
            return vim.fn.input('Port')
        end,
    },
    {
        classPaths = {},
        projectName = "yourProjectName",
        javaExec = "/path/to/your/bin/java",
        mainClass = "your.package.name.MainClassName",
        modulePaths = {},
        name = "Launch YourClassName",
        request = "launch",
        type = "java"
    },
}

dapui.setup({
    mappings = {
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    expand_lines = true,
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 60, -- 40 columns
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 10,
            position = "bottom", -- Can be "bottom" or "top"
        },
    },
    controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = false,
    },
    floating = {
        max_height = 1,    -- These can be integers or a float between 0 and 1.
        max_width = 1,     -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
    }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_over)
vim.keymap.set("n", "<F3>", dap.step_into)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", require("dap.ui.widgets").preview)
vim.keymap.set("n", "<F6>", dap.toggle_breakpoint)
vim.keymap.set("n", "<F7>", dapui.toggle)
vim.keymap.set("n", "<F8>", dap.reverse_continue)
vim.keymap.set("n", "<F9>", dap.restart)
-- NVIM-DAP

-- UNDOTREE
vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle)
-- UNDOTREE

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
-- AUTOCMD

-- fugitive
vim.keymap.set("n", "<Leader>th", ":diffget //2")
vim.keymap.set("n", "<Leader>tl", ":diffget //3")
-- fugitive

-- CUSTOM TEXT OBJECTS
local chars = { "<", ">", "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" }
for _, char in ipairs(chars) do
    for _, mode in ipairs({ "x", "o" }) do
        vim.api.nvim_set_keymap(mode, "i" .. char, string.format(":<C-u>normal! T%svt%s<CR>", char, char),
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap(mode, "a" .. char, string.format(":<C-u>normal! F%svf%s<CR>", char, char),
            { noremap = true, silent = true })
    end
end
-- CUSTOM TEXT OBJECTS
require('lint').linters_by_ft = {
    cs = {}
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

local mason_base_path = vim.fn.stdpath("data") .. "/mason";

require('sonarlint').setup({
    server = {
        cmd = {
            mason_base_path .. '/packages/sonarlint-language-server/sonarlint-language-server',
            '-stdio',
            '-analyzers',
            mason_base_path .. "/share/sonarlint-analyzers/sonarcfamily.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonargo.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonarhtml.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonariac.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonarjava.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonarjs.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonarlintomnisharp.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonarphp.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonarpython.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonartext.jar",
            mason_base_path .. "/share/sonarlint-analyzers/sonarxml.jar",
        },
        autostart = true,
    },
    filetypes = { "csharp", "go", "java" },
})
