local colorscheme = 'solarized'

local ok, _ = pcall(vim.cmd, 'colorscheme '..colorscheme)
if not ok then
  vim.notify('colorscheme '..colorscheme..' not installed')
  return
end

local colors = {
  base03  =  '#002b36',
  base02  =  '#073642',
  base01  =  '#586e75',
  base00  =  '#657b83',
  base0   =  '#839496',
  base1   =  '#93a1a1',
  base2   =  '#eee8d5',
  base3   =  '#fdf6e3',
  yellow  =  '#b58900',
  orange  =  '#cb4b16',
  red     =  '#dc322f',
  magenta =  '#d33682',
  violet  =  '#6c71c4',
  blue    =  '#268bd2',
  cyan    =  '#2aa198',
  green   =  '#859900',
  highlite = '#004b5e', -- additional midtone
}

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {undercurl=true, sp=colors.red})

vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', {fg=colors.green})
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', {fg=colors.cyan})
vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', {fg=colors.blue})

vim.api.nvim_set_hl(0, 'SignColumn', {bg=colors.base02})
vim.api.nvim_set_hl(0, 'GitSignsChange', {fg=colors.blue, bg=colors.base02})
vim.api.nvim_set_hl(0, 'DiagnosticSignError', {fg=colors.red, bg=colors.base02})
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn',  {fg=colors.yellow, bg=colors.base02})
vim.api.nvim_set_hl(0, 'DiagnosticSignHint',  {fg=colors.blue, bg=colors.base02})
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo',  {fg=colors.base3, bg=colors.base02})

vim.api.nvim_set_hl(0, 'LspReferenceText', {bold=true, bg=colors.highlite})
vim.api.nvim_set_hl(0, 'LspReferenceTextRead', {bold=true, bg=colors.highlite})
vim.api.nvim_set_hl(0, 'LspReferenceTextWrite', {bold=true, bg=colors.highlite})

vim.api.nvim_set_hl(0, 'VistaKind', {bold=true, fg=colors.yellow})
vim.api.nvim_set_hl(0, 'VistaTag', {fg=colors.base1})
vim.api.nvim_set_hl(0, 'VistaIcon', {fg=colors.cyan})

return colors
