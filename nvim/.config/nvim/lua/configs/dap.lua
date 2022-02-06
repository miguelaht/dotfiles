require('dapui').setup()

local di_path = vim.fn.stdpath('data') .. '/dapinstall/'
require('dap').set_log_level('ERROR')
local dap = require('dap')

local dap_install = require('dap-install')

dap_install.setup({
  installation_path = di_path,
})

local keymap = vim.keymap.set

keymap('n', '<Leader>sb', [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>so', [[<Cmd>lua require'dap'.step_over()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>si', [[<Cmd>lua require'dap'.step_into()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>n', [[<Cmd>lua require'dap'.continue()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>dq', [[<Cmd>lua require'dap'.terminate()<CR>]], {silent = true, noremap = true})

keymap('v', '<leader>ds', [[<Cmd>lua require('dap-python').debug_selection()<CR>]], {noremap = true})
keymap('n', '<leader>dn', [[<Cmd>lua require('dap-python').test_method()<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>df', [[<Cmd>lua require('dap-python').test_class()<CR>]], {silent = true, noremap = true})

keymap('n', '<leader>do', [[<Cmd>lua require('dapui').open()<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>dc', [[<Cmd>lua require('dapui').close()<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>dt', [[<Cmd>lua require('dapui').toggle()<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>di', [[<Cmd>lua require('dap.ui.widgets').hover()<CR>]], {silent = true, noremap = true})

