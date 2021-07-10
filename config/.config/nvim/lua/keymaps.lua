-- leader key
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>', '<NOP>', {noremap = true, silent = true})

-- delete and keep clipoard
vim.api.nvim_set_keymap('v', '<Leader>p', '_dp', {noremap = true})

-- move lines
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})

-- tab for completion
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t '<C-n>' or t '<Tab>'
end

function _G.soft_tab()
    return vim.fn.pumvisible() == 1 and t '<C-p>' or t '<S-Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.soft_tab()', {expr = true, noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>g', ":Neogit<CR>", {silent = true, noremap = true})

vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
