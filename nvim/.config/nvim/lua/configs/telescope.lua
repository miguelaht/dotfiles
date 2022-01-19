require('telescope').setup{
  defaults = {
    color_devicons = true,
    selection_strategy = "reset",
    winblend = 0,
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    sorting_strategy = "descending",
    layout_strategy = "flex",
    vimgrep_arguments = {
      "rg",
      "--hidden",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
  },
  pickers = {
    git_files = {
      mappings = {
        i = {
        }
      }
    },
    live_grep = {
      theme = "ivy",
    },
    grep_string = {
      theme = "ivy",
    },
    find_files = {
      theme = "dropdown",
    },
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    }
  },
  extensions = {
    file_browser = {
      theme = "ivy",
    },
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },

    fzf_writer = {
      use_highlighter = false,
      minimum_grep_characters = 6,
    },

    frecency = {
      workspaces = {
        ["conf"] = "~/.config/nvim/",
      },
    },
  },
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')

-- Git
vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], {noremap = true, silent = true})

-- Search
vim.api.nvim_set_keymap('n', '<Leader>pw', [[<Cmd>lua require('telescope.builtin').live_grep({ search = vim.fn.expand("<cword>") })<CR>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>ps', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], {noremap = true, silent = true})

-- Files and buffers
vim.api.nvim_set_keymap('n', '<Leader>pf', [[<Cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap = true, silent = true})