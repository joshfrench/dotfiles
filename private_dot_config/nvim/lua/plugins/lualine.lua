local function paste()
  return "PASTE"
end

local function pwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':~:.')
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

local colors = require('user.colors')

local function modified()
  if vim.bo.mod then
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

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    {
      dir = "~/src/joshfrench/yaml-companion.nvim/"
    }
  },
  opts = {
    options = {
      icons_enabled = true,
      theme = theme,
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        'dapui_scopes',
        'dapui_breakpoints',
        'dapui_stacks',
        'dapui_watches',
        'dap-repl',
        'dapui_console',
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
      always_divide_middle = false,
      globalstatus = true,
    },
    sections = {
      lualine_a = { 'mode', { paste, cond = function() return vim.o.paste end } },
      lualine_b = {
        pwd,
        { 'branch', icons_enabled = false },
      },
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
      },
      lualine_b = {
        { 'aerial', sep = ' > ', color = { fg = colors.base1, bg = colors.highlite, bold = true, } },
      },
    },
    inactive_winbar = {
      lualine_a = {
        { modified,                                     color = { fg = colors.red, bg = colors.base02 }, separator = "" },
        { function() return vim.fn.expand('%:~:.') end, color = { bg = colors.base02 } },
      },
    }
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyDone',
      callback = function()
        vim.api.nvim_set_hl(0, 'WinBar', { fg = colors.base1, bg = colors.highlite })
        vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.base00, bg = colors.highlite })
        vim.api.nvim_set_hl(0, 'WinBarMod', { fg = colors.red, bg = colors.highlite })
        vim.api.nvim_set_hl(0, 'WinBarNC', { fg = colors.base1, bg = colors.base02 })
      end
    })
  end
}
