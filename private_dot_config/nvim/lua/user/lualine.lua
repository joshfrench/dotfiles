local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

local function pwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':~:.')
end

local function paste()
  return "PASTE"
end


local function schema()
  local s = require('yaml-companion').get_buf_schema(0)
  if s.result and #s.result > 0 then
    local schemas = {}
    for _, r in ipairs(s.result) do
      if r.name ~= "none" then
        table.insert(schemas, r.name)
      end
    end
    return table.concat(schemas, ',')
  end
end

local colors = require('user.colorscheme')

local function modified()
  if vim.bo.mod then
    -- return '%#WinBarMod#●%*'
    return '●'
  else
    return ""
  end
end

local theme = {
  normal = {
    a = { fg = colors.base03, bg = colors.blue },
    b = { fg = colors.base03, bg = colors.base00 },
    c = { fg = colors.base1, bg = colors.base02 },
    y = { bg = colors.base02 },
    z = { bg = colors.base02 }
  },
  insert = { a = { fg = colors.base03, bg = colors.green }, z = { bg = colors.base02 } },
  visual = { a = { fg = colors.base03, bg = colors.magenta }, z = { bg = colors.base02 } },
  replace = { a = { fg = colors.base03, bg = colors.red }, z = { bg = colors.base02 } },
  inactive = {
    a = { fg = colors.base0, bg = colors.base02 },
    b = { fg = colors.base03, bg = colors.base00 },
    c = { fg = colors.base01, bg = colors.base02 },
  },
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      winbar = { 'NvimTree', 'dapui_scopes', 'dapui_breakpoints', 'dapui_stacks', 'dapui_watches', 'dap-repl', 'dapui_console' },
      'help',
      'startify',
      'aerial',
      'dashboard',
      'packer',
      'NvimTree',
      'Trouble',
      'alpha',
      'qf',
    },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode', { paste, cond = function() return vim.o.paste end } },
    lualine_b = {
      pwd,
      { 'branch', icons_enabled = false },
    },
    -- lualine_c = { relative_path, { require 'nvim-navic'.get_location, cond = require 'nvim-navic'.is_available } },
    lualine_c = {},
    lualine_x = { 'diagnostics', 'filetype', schema },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'nvim-tree' },
  winbar = {
    lualine_a = {
      { modified,                                     color = 'WinBarMod' },
      { function() return vim.fn.expand('%:~:.') end, color = 'WinBar' },
      { 'aerial',                                     sep = ' > ',        color = 'WinBar' },
    },
    lualine_b = {
    }

  },
  inactive_winbar = {
    lualine_a = {
      { modified,                                     color = { fg = colors.red, bg = colors.base02 }, separator = "" },
      { function() return vim.fn.expand('%:~:.') end, color = { bg = colors.base02 } },
    },
  }
})
