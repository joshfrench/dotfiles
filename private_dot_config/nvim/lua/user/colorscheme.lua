local colorscheme = 'solarized'

local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not installed')
  return
end

require('colorizer').setup()

local colors = {
  base03   = '#002b36',
  base02   = '#073642',
  base01   = '#586e75',
  base00   = '#657b83',
  base0    = '#839496',
  base1    = '#93a1a1',
  base2    = '#eee8d5',
  base3    = '#fdf6e3',
  yellow   = '#b58900',
  orange   = '#cb4b16',
  red      = '#dc322f',
  magenta  = '#d33682',
  violet   = '#6c71c4',
  blue     = '#268bd2',
  cyan     = '#2aa198',
  green    = '#859900',
  highlite = '#004b5e', -- additional midtone
}

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = colors.red })

vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = colors.green })
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = colors.blue })

vim.api.nvim_set_hl(0, 'SignColumn', { bg = colors.base02 })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = colors.blue, bg = colors.base02 })
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = colors.red, bg = colors.base02 })
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = colors.yellow, bg = colors.base02 })
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = colors.blue, bg = colors.base02 })
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = colors.base3, bg = colors.base02 })
vim.api.nvim_set_hl(0, 'DiagnosticSignOk', { fg = colors.green, bg = colors.base02 })

vim.api.nvim_set_hl(0, 'LspReferenceText', { bold = true, bg = colors.highlite })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bold = true, bg = colors.highlite })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bold = true, bg = colors.highlite })
vim.api.nvim_set_hl(0, 'LspCodeLens', { italic = true, fg = colors.base01 })
vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', { italic = true, fg = colors.base01 })

vim.api.nvim_set_hl(0, 'HighlightedyankRegion', { bg = colors.highlite })

vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = colors.base02 })

vim.api.nvim_set_hl(0, 'AerialLine', { bold = true, bg = colors.highlite })

vim.api.nvim_set_hl(0, 'WinBar', { fg = colors.base1, bg = colors.highlite })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.base00, bg = colors.highlite })
vim.api.nvim_set_hl(0, 'WinBarMod', { fg = colors.red, bg = colors.highlite })
vim.api.nvim_set_hl(0, 'WinBarNC', { fg = colors.base1, bg = colors.base02 })

vim.api.nvim_set_hl(0, 'MarkSignHL', { fg = colors.blue, bg = colors.base02 })

for hl, color in pairs({
  TSRainbowRed = colors.red,
  TSRainbowYellow = colors.yellow,
  TSRainbowBlue = colors.blue,
  TSRainbowOrange = colors.orange,
  TSRainbowGreen = colors.green,
  TSRainbowViolet = colors.violet,
  TSRainbowCyan = colors.cyan,

  DapUIScope = colors.cyan,
  DapUIType = colors.violet,
  DapUIModifiedValue = colors.cyan,
  DapUIDecoration = colors.cyan,
  DapUIThread = colors.green,
  DapUIStoppedThread = colors.cyan,
  DapUISource = colors.violet,
  DapUILineNumber = colors.cyan,
  DapUIFloatBorder = colors.cyan,
  DapUIWatchesEmpty = colors.red,
  DapUIWatchesValue = colors.green,
  DapUIWatchesError = colors.red,
  DapUIBreakpointsPath = colors.cyan,
  DapUIBreakpointsInfo = colors.green,
  DapUIBreakpointsCurrentLine = colors.green,
  DapUIBreakpointsDisabledLine = colors.base1,
  DapUIStepOver = colors.cyan,
  DapUIStepInto = colors.cyan,
  DapUIStepBack = colors.cyan,
  DapUIStepOut = colors.cyan,
  DapUIStop = colors.red,
  DapUIPlayPause = colors.green,
  DapUIRestart = colors.green,
  DapUIUnavailable = colors.base1,
  DapUIWinSelect = colors.cyan,
}) do
  vim.api.nvim_set_hl(0, hl, { fg = color })
end

vim.cmd [[ hi link coffeeSpaceError NONE ]]
vim.cmd [[ hi link coffeeSemicolonError NONE ]]

return colors
