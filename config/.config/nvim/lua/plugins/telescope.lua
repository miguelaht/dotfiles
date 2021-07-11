require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})
require('telescope').load_extension('fzy_native')

vim.api.nvim_set_keymap('n', '<Leader>ps', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]],
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>pf', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', [[<Cmd>lua require('telescope.builtin').file_browser()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>pw',
                        [[<Cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown({ search = vim.fn.expand("<cword>") }))<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>pb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>tt', [[<Cmd>Telescope<CR>]], {noremap = true, silent = true})

