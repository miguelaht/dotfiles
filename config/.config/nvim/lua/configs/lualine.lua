require('lualine').setup {
  options = {theme = 'gruvbox-flat', section_separators = {'', ''}, component_separators = {'', ''}},
  sections = {
    lualine_a = {{'mode', upper = true}},
    lualine_b = {{'branch', icon = ''}},
    lualine_c = {{'filename', file_status = true}},
    lualine_x = {{'diagnostics', sources = {'nvim_lsp'}, sections = {'error', 'warn', 'info', 'hint'}, symbols = {error = '  ', warn = '  ', info = '  ', hint = '  '}}, 'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {'filename'}, lualine_x = {'location'}, lualine_y = {}, lualine_z = {}},
  extensions = {'fzf'}
}
