local o = vim.opt
local api = vim.api
local home = os.getenv("HOME")

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.mouse = 'a'
o.scrolloff = 8
o.colorcolumn = '80'
o.hlsearch = true
o.incsearch = true
o.syntax='on'
o.hidden = true
o.cmdheight = 1
o.updatetime = 50
o.errorbells = false
o.swapfile = false
o.backup = false
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.showmode = false
o.completeopt = {'menuone','noinsert','noselect'}
o.wrap = false
o.number = true
o.relativenumber = true
o.undofile = true
o.termguicolors = true
o.undodir = {home..'/.vim/undodir'}
o.shortmess:remove({I = true}, {c = true}, {F = true})

-- python
api.nvim_set_var('python3_host_prog', '/usr/local/bin/python3')
api.nvim_set_var('python_host_prog', 'usr/bin/python')

-- trim on save
api.nvim_exec([[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup trimOnSave
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>
]], true)

-- compile packer when file is updated
api.nvim_exec([[
autocmd BufWritePost plugins.lua PackerCompile
]], true)
