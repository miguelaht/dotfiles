require('dapui').setup()
local keymap = vim.api.nvim_set_keymap
local dap = require('dap')
dap.set_log_level('DEBUG')
local dap_install = require('dap-install')

dap_install.setup({
  installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

local python_env = function()
  local env = os.getenv('VIRTUAL_ENV')
  if env == nil then
    return '/usr/local/bin/python3'
  else
    return env .. '/bin/python3'
  end
end;

require('dap-python').setup(python_env())

dap.adapters.python = {
  type = 'executable',
  command = python_env(),
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = python_env;
  },
}
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {vim.fn.stdpath('data') .. '/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js'},
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
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
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
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

keymap('n', '<Leader>sb', [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>so', [[<Cmd>lua require'dap'.step_over()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>n', [[<Cmd>lua require'dap'.continue()<CR>]], {silent = true, noremap = true})


keymap('v', '<leader>ds', [[<Cmd>lua require('dap-python').debug_selection()<CR>]], {noremap = true})
keymap('n', '<leader>dn', [[<Cmd>lua require('dap-python').test_method()<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>df', [[<Cmd>lua require('dap-python').test_class()<CR>]], {silent = true, noremap = true})

keymap('n', '<leader>do', [[<Cmd>lua require('dapui').open()<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>dc', [[<Cmd>lua require('dapui').close()<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>dt', [[<Cmd>lua require('dapui').toggle()<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>di', [[<Cmd>lua require('dap.ui.widgets').hover()<CR>]], {silent = true, noremap = true})

