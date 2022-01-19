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
  attach = {pidProperty = "pid", pidSelect = "ask"},
  command = '/usr/local/opt/llvm@13/bin/lldb-vscode',
  name = "lldb",
  env = {LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"}
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
        'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false
  }
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


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

-- react
dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {di_path .. "chrome/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  }
}

dap.configurations.typescriptreact = { -- change to typescript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  }
}


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

