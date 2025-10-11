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
vim.opt.undodir = string.format("%s/.vim/undodir", os.getenv("HOME"))
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
---

-- KEYMAPS
vim.keymap.set({ "n", "v" }, "<Up>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Down>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Left>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Right>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.keymap.set("n", "<Leader><Leader>", "<c-^>")
vim.keymap.set("n", "[q", ":cprevious<CR>")
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[l", ":lprevious<CR>")
vim.keymap.set("n", "]l", ":lnext<CR>")
vim.keymap.set("n", "<Leader>q", ":copen<CR>")
---

-- PLUGINS
vim.pack.add({
    { src = "git@github.com:mbbill/undotree" },
    { src = "git@github.com:nvim-lua/plenary.nvim" },
    {
        src = "git@github.com:ThePrimeagen/harpoon",
        version = "harpoon2"
    },
    { src = "git@github.com:tpope/vim-fugitive" },
    {
        src = "git@github.com:nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    },
    { src = "git@github.com:nvim-treesitter/nvim-treesitter-context" },
    { src = "git@github.com:mfussenegger/nvim-dap" },
    { src = "git@github.com:rcarriga/nvim-dap-ui" },
    {
        src = "git@github.com:nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    },
    { src = "git@github.com:nvim-telescope/telescope.nvim" },
    { src = "git@github.com:neovim/nvim-lspconfig" },
    { src = "git@github.com:williamboman/mason.nvim" },
    { src = "git@github.com:hrsh7th/cmp-nvim-lsp" },
    { src = "git@github.com:hrsh7th/nvim-cmp" },
    { src = "git@github.com:Issafalcon/lsp-overloads.nvim" },
    { src = "git@github.com:rcarriga/nvim-dap-ui" },
    { src = "git@github.com:mfussenegger/nvim-dap" },
    { src = "git@github.com:nvim-neotest/nvim-nio" },
})
---

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
---

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
---

-- HARPOON
local harpoon = require("harpoon");
harpoon:setup()

vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
vim.keymap.set("n", "<Leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

for var = 1, 4 do
    vim.keymap.set("n", string.format("<Leader>%d", var), function()
        harpoon:list():select(var)
    end)
end
---

-- UNDOTREE
vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle)
---

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
---

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
---

-- MASON
require("mason").setup()
---

-- LSP
vim.lsp.config('*', {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        -- Unset 'formatexpr'
        vim.bo[args.buf].formatexpr = nil
        -- Unset 'omnifunc'
        vim.bo[args.buf].omnifunc = nil

        local opts = { noremap = true, buffer = args.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<Leader>l", vim.diagnostic.setloclist, opts)
        -- Disable document colors
        vim.lsp.document_color.enable(false, args.buf)

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
    end,
})

vim.lsp.enable("omnisharp")
vim.lsp.enable("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})
---

-- NVIM-CMP
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
        expand = {},
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
    }),
})
---

--- DAP
local dap = require("dap")
local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"]     = function()
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

dap.adapters.coreclr = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg",
    args = { "--interpreter=vscode" }
}

dap.configurations.cs                                 = {
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
