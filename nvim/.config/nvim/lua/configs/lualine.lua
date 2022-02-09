require("lualine").setup {
  options = {
    theme = "github",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {{"mode", upper = true}},
    lualine_b = {{"branch"}},
    lualine_c = {{"filename"}, {"lsp_progress"}},
    lualine_x = {
    {
        "diagnostics",
        symbols = {error = "E", warn = "W", info = "I", hint = "H"},
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }
    },
    lualine_y = {"location"},
    lualine_z = {"progress"},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{"filename", file_status = true, path = 1}},
    lualine_x = {},
    lualine_y = {"location"},
    lualine_z = {},
  },
}
