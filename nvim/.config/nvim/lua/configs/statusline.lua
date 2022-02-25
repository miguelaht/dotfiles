local fn = vim.fn
local api = vim.api

local function filemodified()
  if not vim.bo.modifiable then
    return " [RO]"
  end
  if vim.bo.modifiable and vim.bo.modified then
		return " [+]"
	end
	return " [ ]"
end

local function filepath()
  local fpath = fn.fnamemodify(fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filetype()
  local ftype = vim.bo.filetype
  if ftype == "" then
    return string.format(" %s ", vim.bo.filetype)
  end

  return string.format(" [%s] ", vim.bo.filetype)
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %-14.(%l,%c%V%) %P "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#DiagnosticsError#E " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#DiagnosticsWarn#W " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#DiagnosticsHint#H " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#DiagnosticsInfo#I " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Statusline# "
end

Statusline = {}

Statusline.active = function ()
  return table.concat({
    "%#Statusline#",
    filemodified(),
    filetype(),
    "%#Statusline#",
    filepath(),
    "%=%#Statusline#",
    lsp(),
    "%#Statusline#",
    lineinfo(),
  })
end

function Statusline.inactive()
  return " %F"
end

api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]], false)
