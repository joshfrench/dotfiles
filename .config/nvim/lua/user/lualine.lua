local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
    color = {gui = "none"},
  },
  sections = {
    lualine_a = {'mode', 'paste'},
    lualine_b = {{'branch', icons_enabled = false, color = {bg = '#657b83'}}, 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
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
