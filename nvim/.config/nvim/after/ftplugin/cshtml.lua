-- set cshtml as html
api.nvim_exec([[
fun! SetHTML()
    set filetype=html
endfun

augroup trimOnSave
    autocmd!
    autocmd BufReadPre,BufReadPost,BufNewFile *.cshtml :call SetHTML()
augroup END
]], true)
