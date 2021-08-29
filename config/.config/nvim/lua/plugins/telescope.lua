require('telescope').setup{
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    sorting_strategy = "descending",
    layout_strategy = "flex",
  }
}

require('telescope').load_extension('fzy_native')

-- Git
vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], {noremap = true, silent = true})

-- Search
vim.api.nvim_set_keymap('n', '<Leader>pw', [[<Cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({ search = vim.fn.expand("<cword>") }))<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ps', [[<Cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_ivy({ search = vim.fn.input("Grep For > ")}))<CR>]], {noremap = true, silent = true})

-- Files and buffers
vim.api.nvim_set_keymap('n', '<Leader>ff', [[<Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>pf', [[<Cmd>lua require('telescope.builtin').file_browser(require('telescope.themes').get_dropdown())<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b', [[<Cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<CR>]], {noremap = true, silent = true})
