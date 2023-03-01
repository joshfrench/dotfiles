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

vim.api.nvim_set_hl(0, 'DapUIScope', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIType', { fg = colors.violet })
vim.api.nvim_set_hl(0, 'DapUIModifiedValue', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIDecoration', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIThread', { fg = colors.green })
vim.api.nvim_set_hl(0, 'DapUIStoppedThread', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUISource', { fg = colors.violet })
vim.api.nvim_set_hl(0, 'DapUILineNumber', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIFloatBorder', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIWatchesEmpty', { fg = colors.red })
vim.api.nvim_set_hl(0, 'DapUIWatchesValue', { fg = colors.green })
vim.api.nvim_set_hl(0, 'DapUIWatchesError', { fg = colors.red })
vim.api.nvim_set_hl(0, 'DapUIBreakpointsPath', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIBreakpointsInfo', { fg = colors.green })
vim.api.nvim_set_hl(0, 'DapUIBreakpointsCurrentLine', { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, 'DapUIBreakpointsDisabledLine', { fg = colors.base1 })
vim.api.nvim_set_hl(0, 'DapUIStepOver', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIStepInto', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIStepBack', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIStepOut', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DapUIStop', { fg = colors.red })
vim.api.nvim_set_hl(0, 'DapUIPlayPause', { fg = colors.green })
vim.api.nvim_set_hl(0, 'DapUIRestart', { fg = colors.green })
vim.api.nvim_set_hl(0, 'DapUIUnavailable', { fg = colors.base1 })
vim.api.nvim_set_hl(0, 'DapUIWinSelect', { fg = colors.cyan })

vim.cmd [[ hi link coffeeSpaceError NONE ]]
vim.cmd [[ hi link coffeeSemicolonError NONE ]]

return colors
