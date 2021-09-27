-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/miguelaht/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/miguelaht/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/miguelaht/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/miguelaht/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/miguelaht/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["cheat.sh-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/opt/cheat.sh-vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  fzf = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/opt/fzf"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17goto-preview\frequire\0" },
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/goto-preview"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/gruvbox-flat.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/opt/lsp_extensions.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\nç\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\tkeys\6n\1\0\3\npaste\6p\17paste_behind\6P\vselect\t<cr>\6i\1\0\0\1\0\3\npaste\n<c-p>\17paste_behind\n<c-k>\vselect\t<cr>\ron_paste\1\0\1\fset_reg\1\1\0\4\fpreview\2\24content_spec_column\1\21default_register\6\"\fhistory\3Ë\a\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/refactoring.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/miguelaht/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\nç\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\tkeys\6n\1\0\3\npaste\6p\17paste_behind\6P\vselect\t<cr>\6i\1\0\0\1\0\3\npaste\n<c-p>\17paste_behind\n<c-k>\vselect\t<cr>\ron_paste\1\0\1\fset_reg\1\1\0\4\fpreview\2\24content_spec_column\1\21default_register\6\"\fhistory\3Ë\a\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
