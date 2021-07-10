vim.api.nvim_command('syntax on')

vim.api.nvim_exec([[
set colorcolumn=80
set tabstop=4 softtabstop=4
set shiftwidth=4
]], true)

vim.o.mouse = 'a'
vim.o.expandtab = true
vim.o.hidden = true
vim.o.scrolloff = 8
vim.o.cmdheight = 1
vim.o.updatetime = 50
vim.o.hlsearch = false
vim.o.errorbells = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.incsearch = true
vim.o.showmode = false
vim.o.completeopt = "menuone,noinsert,noselect"
vim.cmd('set shortmess-=cF')
vim.cmd('set nowrap')
vim.cmd('set nu')
vim.cmd('set relativenumber')
vim.cmd('set undofile')
vim.api.nvim_command('set undodir=~/.vim/undodir')
vim.cmd('set termguicolors')
-- vim.api.nvim_command([[set spell spelllang=en]])
-- vim.api.nvim_command([[set spell spelllang=es]])

-- python
vim.api.nvim_set_var('python3_host_prog', '/usr/local/bin/python3')
vim.api.nvim_set_var('python_host_prog', 'usr/bin/python')

-- lua efm
vim.api.nvim_exec([[
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
]], true)

-- trim on save
vim.api.nvim_exec([[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup trimOnSave
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
]], true)

-- compile packer when file is updated
vim.api.nvim_exec([[
autocmd BufWritePost plugins.lua PackerCompile
]], true)

-- set cshtml as html
vim.api.nvim_exec([[
fun! SetHTML()
    set filetype=html
endfun

augroup trimOnSave
    autocmd!
    autocmd BufReadPre,BufReadPost,BufNewFile *.cshtml :call SetHTML()
augroup END
]], true)
