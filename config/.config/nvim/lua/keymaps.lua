local keymap = vim.api.nvim_set_keymap
local g = vim.g

g.mapleader = ' '
keymap('n', '<Leader>', '<NOP>', {noremap = true, silent = true})

keymap('v', '<Leader>p', '_dp', {noremap = true})
keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})
keymap('n', '<Leader><Leader>', '<c-^>', {silent = true, noremap = true})

-- DAP
keymap('n', '<Leader>sb', [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>so', [[<Cmd>lua require'dap'.step_over()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>n', [[<Cmd>lua require'dap'.continue()<CR>]], {silent = true, noremap = true})

-- goto
keymap('n', '<Leader>gpd', [[<Cmd>lua require('goto-preview').goto_preview_definition()<CR>]], {silent = true, noremap = true })
keymap('n', '<Leader>gpi', [[<Cmd>lua require('goto-preview').goto_preview_implementation()<CR>]], {silent = true, noremap = true })
keymap('n', '<Leader>gP', [[<Cmd>lua require('goto-preview').close_all_win()<CR>]], {silent = true, noremap = true })
