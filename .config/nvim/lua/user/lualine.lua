local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

local ok, lsp_status = pcall(require, 'lsp-status')
if not ok then
  return
end

local function pwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

local function paste()
  return "PASTE"
end

local function status()
  return lsp_status.status()
end

local colors = require('user.colorscheme')

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
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode', {paste, cond = function() return vim.o.paste end}},
    lualine_b = {
      pwd,
      {'branch', icons_enabled = false}
    },
    lualine_c = {'filename', {status, cond = function() return #vim.lsp.buf_get_clients() > 0 end}},
    lualine_x = {'diagnostics', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree'}
})
