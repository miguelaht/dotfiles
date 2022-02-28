require("keymaps")
require("sets")
require("netrw")
require("plugins")
require("configs.treesitter")
require("configs.telescope")
require("configs.lsp")
require("configs.cmp")
require("configs.colors")
require("configs.comment")
require("configs.toggleterm")
require("configs.snippets")
--require("configs.lualine")
--require("configs.statusline")
--require("configs.dap")

vim.api.nvim_create_augroup({ name = "TrimOnSave" })
vim.api.nvim_create_autocmd({
  event = "BufWritePre",
  group = "TrimOnSave",
  callback = function ()
    local current_view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(current_view)
  end
})

