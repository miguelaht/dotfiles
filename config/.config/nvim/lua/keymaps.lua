local keymap = vim.api.nvim_set_keymap
local g = vim.g

g.mapleader = ' '
keymap('n', '<Leader>', '<NOP>', {noremap = true, silent = true})

keymap('v', '<Leader>p', '_dp', {noremap = true})
keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})
keymap('n', '<Leader><Leader>', '<c-^>', {silent = true, noremap = true})
