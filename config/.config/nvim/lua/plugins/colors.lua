vim.api.nvim_exec([[
    let g:gruvbox_contrast_dark = 'hard'
    colorscheme gruvbox
    ]], true)

vim.api.nvim_exec([[
    highlight ColorColumn ctermbg=0
    highlight Normal guibg=none
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    highlight link CompeDocumentation NormalFloat
    ]], true)
