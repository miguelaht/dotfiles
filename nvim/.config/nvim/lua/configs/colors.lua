-- gruvbox-flat
--[[ vim.g.gruvbox_flat_style = "hard"

vim.g.gruvbox_italic_comments = false
vim.g.gruvbox_italic_keywords = false
vim.g.gruvbox_italic_functions = false
vim.g.gruvbox_transparent = true
vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" } ]]

-- vim.cmd([[colorscheme gruvbox-flat]])

require('github-theme').setup({
  theme_style = 'dark',
  comment_style = "NONE",
  keyword_style = "NONE",
  function_style = "NONE",
  variable_style = "NONE",
  dark_float = true,
})
