local colorscheme = 'solarized'

local ok, _ = pcall(vim.cmd, 'colorscheme '..colorscheme)
if not ok then
  vim.notify('colorscheme '..colorscheme..' not installed')
  return
end

local base = vim.g.terminal_color_0 --#073642
local red = vim.g.terminal_color_1 --#dc322f
local green = vim.g.terminal_color_2 --#859900
local yellow = vim.g.terminal_color_3 --#b58900
local blue = vim.g.terminal_color_4 --#268bd2
local magenta = vim.g.terminal_color_5 --#d33682
local cyan = vim.g.terminal_color_6 --#2aa198
local purple = vim.g.terminal_color_13 --#6c71c4
local bright_white = vim.g.terminal_color_15 --#fdf6e3
local highlight = '#004b5e' -- midtone bg

vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', {fg=green})
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', {fg=cyan})
vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', {fg=blue})
vim.api.nvim_set_hl(0, 'SignColumn', {bg=base})
vim.api.nvim_set_hl(0, 'GitSignsChange', {fg=blue, bg=base})
