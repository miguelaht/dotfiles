local keymap = vim.api.nvim_set_keymap

-- Bufffers and Files
-- keymap('n', '<Leader>q', [[<Cmd>lua require('fzf-lua').quickfix()<CR>]], {noremap = true, silent = true})
-- keymap('n', '<C-b>', [[<Cmd>lua require('fzf-lua').buffers()<CR>]], {noremap = true, silent = true})

-- Search
-- keymap('n', '<Leader>ps', [[<Cmd>lua require('fzf-lua').grep()<CR>]], {noremap = true, silent = true})
-- keymap('n', '<Leader>pw', [[<Cmd>lua require('fzf-lua').live_grep()<CR>]], {noremap = true, silent = true})
-- keymap('n', '<Leader>ff', [[<Cmd>lua require('fzf-lua').files()<CR>]], {noremap = true, silent = true})
keymap('v', '<Leader><Leader>', [[<Cmd>lua require('fzf-lua').grep_visual()<CR>]], {noremap = true})

-- GIT
-- keymap('n', '<C-p>', [[<Cmd>lua require('fzf-lua').git_files()<CR>]], {noremap = true, silent = true})

-- LSP
-- keymap('n', '<Leader>vrr', [[<Cmd>lua require('fzf-lua').lsp_references()<CR>]], {noremap = true, silent = true})
-- keymap('n', '<Leader>vd', [[<Cmd>lua require('fzf-lua').lsp_definitions()<CR>]], {noremap = true, silent = true})
-- keymap('n', '<Leader>vi', [[<Cmd>lua require('fzf-lua').lsp_implementations()<CR>]], {noremap = true, silent = true})
-- keymap('n', '<Leader>vca', [[<Cmd>lua require('fzf-lua').lsp_code_actions()<CR>]], {noremap = true, silent = true})
-- keymap('n', '<Leader>dd', [[<Cmd>lua require('fzf-lua').lsp_document_diagnostics()<CR>]], {noremap = true, silent = true})
