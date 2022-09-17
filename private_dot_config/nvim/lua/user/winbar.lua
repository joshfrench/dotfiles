local ok_icons, icons = pcall(require, "nvim-web-devicons")
local ok_navic, navic = pcall(require, 'nvim-navic')
local colors = require('user.colorscheme')

local sep = "%#WinSeparator# > %*"

local M = {}

M.excludes = {
  'help',
  'startify',
  'vista',
  'vista_kind',
  'dashboard',
  'packer',
  'NvimTree',
  'Trouble',
  'alpha',
  'qf',
}

-- wraps `term` in `hl` group iff STL belongs to the active window
local function a(hl, term)
  local winnr = tostring(vim.api.nvim_get_current_win())
  if winnr == vim.g.actual_curwin then
    return ('%#' .. hl .. '#' .. term .. '%*')
  else
    return term
  end
end

local function excludes()
  if vim.tbl_contains(M.excludes, vim.bo.filetype) or
      vim.api.nvim_buf_get_name(0):match('_Luapad.lua') then
    vim.opt_local.winbar = ""
    return true
  else
    return false
  end
end

local function path()
  local relpath = vim.fn.expand('%:~:.:h')
  local t = {}
  for seg in string.gmatch(relpath, '[^/]+') do
    table.insert(t, seg)
  end
  return table.concat(t, sep)
end

local function head()
  local ft = vim.bo.filetype
  local h = vim.fn.expand('%:t')
  if not ok_icons then
    return h
  else
    local icon, color = icons.get_icon_color(h, ft)
    if icon then
      local hl = 'WinBarIcon' .. ft:gsub('^%l', string.upper)
      vim.api.nvim_set_hl(0, hl, { bg = colors.highlite, fg = color })
      return a(hl, icon .. ' ' .. h)
    else
      return h
    end
  end
end

local function navic_location()
  if ok_navic and navic.is_available then
    return navic.get_location({ highlight = true, icons = {} })
  else
    return ""
  end
end

local function modified()
  if vim.bo.mod then
    return ' %#WinBarMod#●%*'
  else
    return ""
  end
end

M.get_winbar = function()
  if excludes() then
    return ""
  end

  local segments = {
    path(),
    head(),
  }

  segments = vim.tbl_filter(function(s)
    if s == nil or s == "" then
      return false
    else
      return true
    end
  end, segments)

  local bar = table.concat(segments, sep)

  local nav = navic_location()
  if not (nav == nil or nav == "") then
    bar = bar .. '%#WinSeparator# | %*' .. nav
  end

  return ' ' .. bar .. modified()
end

vim.o.winbar = "%{%v:lua.require'user.winbar'.get_winbar()%}"

return M
