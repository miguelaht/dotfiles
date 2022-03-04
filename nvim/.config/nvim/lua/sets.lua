local o = vim.opt
local api = vim.api
local home = os.getenv("HOME")

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true

o.syntax="on"
o.colorcolumn = "80"
o.termguicolors = true

o.number = true
o.relativenumber = true

o.scrolloff = 8

o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = {home.."/.vim/undodir"}

o.wrap = false
o.fileencoding = "utf-8"
o.completeopt = {"menuone","noinsert","noselect"}
o.mouse = "a"
o.updatetime = 50

o.wildignore = {'**/node_modules/**'}
o.path:append('**')

-- providers
api.nvim_set_var("python3_host_prog", home.."/.asdf/shims/python")
api.nvim_set_var("loaded_python_provider", 0)
api.nvim_set_var("loaded_perl_provider", 0)
api.nvim_set_var("loaded_ruby_provider", 0)
