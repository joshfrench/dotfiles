local ok_icons, icons = pcall(require, "nvim-web-devicons")
local ok_navic, navic = pcall(require, 'nvim-navic')
local colors = require('user.colorscheme')

local sep = "%#WinSeparator# > %*"

local M = {}

M.excludes = {
  'help',
  'startify',
  'vista_kind',
  'dashboard',
  'packer',
  'NvimTree',
  'Trouble',
  'alpha',
  'qf',
}

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
      local hl = 'WinBarIcon' .. ft
      vim.api.nvim_set_hl(0, hl, { fg = color, bg = colors.base02 })
      return '%#' .. hl .. '#' .. icon .. ' ' .. h .. '%*'
    else
      return h
    end
  end
end

local function navic_location()
  if not ok_navic then
    return ""
  else
    return navic.get_location()
  end
end

local function modified()
  if vim.bo.mod then
    -- return ' %#WinBarMod#[+]%*'
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
    navic_location(),
  }

  segments = vim.tbl_filter(function(s)
    if s == nil or s == "" then
      return false
    else
      return true
    end
  end, segments)

  return ' ' .. table.concat(segments, sep) .. modified()

  -- return ' ' .. path() .. sep .. head() .. sep .. navic_location()
end

vim.o.winbar = "%{%v:lua.require'user.winbar'.get_winbar()%}"

return M
-- " %#MsgArea#lua > %*%#MsgArea#user > %*%#DevIconlua# %*%#String#winbar.lua%*"
-- vim.opt.winbar = '%#MSGAREA'
