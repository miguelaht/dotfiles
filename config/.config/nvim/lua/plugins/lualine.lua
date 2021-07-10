require('lualine').setup {
    options = {theme = 'gruvbox', section_separators = {'', ''}, component_separators = {'', ''}, icons_enabled = true},
    sections = {
        lualine_a = {{'mode', upper = true}},
        lualine_b = {{'branch', icon = ''}, {'diagnostics', sources = {'nvim_lsp'}, symbols = {error = ' ', warn = ' ', info = ' '}}},
        lualine_c = {{'filename', file_status = true}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {'filename'}, lualine_x = {'location'}, lualine_y = {}, lualine_z = {}},
    extensions = {'fzf'}
}
