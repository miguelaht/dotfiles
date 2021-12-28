require('dapui').setup()

local di_path = vim.fn.stdpath('data') .. '/dapinstall/'
require('dap').set_log_level('ERROR')
local dap = require('dap')

local dap_install = require('dap-install')

dap_install.setup({
  installation_path = di_path,
})

-- python
local python_env = function()
  local env = os.getenv('VIRTUAL_ENV')
  if env == nil then
    return '/usr/local/bin/python3'
  else
    return env .. '/bin/python3'
  end
end;

require('dap-python').setup(python_env())

-- rust
dap.adapters.lldb = {
  type = 'executable',
  command = di_path .. 'cppr_vsc',
  name = "lldb"
}

-- javascript node
dap_install.config('jsnode', {})
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {di_path .. 'jsnode/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
dap.configurations.typescript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}


local keymap = vim.api.nvim_set_keymap

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

