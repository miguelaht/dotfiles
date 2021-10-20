local python_env = function()
  local env = os.getenv('VIRTUAL_ENV')
  if env == 1 then
    return env .. '/bin/python3'
  else
    return '/usr/bin/python3'
  end
end;

require('dap-python').setup(python_env())

local dap = require('dap')
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

keymap('n', '<Leader>sb', [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>so', [[<Cmd>lua require'dap'.step_over()<CR>]], {silent = true, noremap = true})
keymap('n', '<Leader>n', [[<Cmd>lua require'dap'.continue()<CR>]], {silent = true, noremap = true})

keymap('n', '<leader>dn', [[<Cmd>lua require('dap-python').test_method()<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>df', [[<Cmd>lua require('dap-python').test_class()<CR>]], {silent = true, noremap = true})
