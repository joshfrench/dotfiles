local base03   = '#002b36'
local base02   = '#073642'
local base01   = '#586e75'
local base00   = '#657b83'
local base0    = '#839496'
local base1    = '#93a1a1'
local base2    = '#eee8d5'
local base3    = '#fdf6e3'
local yellow   = '#b58900'
local orange   = '#cb4b16'
local red      = '#dc322f'
local magenta  = '#d33682'
local violet   = '#6c71c4'
local blue     = '#268bd2'
local cyan     = '#2aa198'
local green    = '#859900'
local highlite = '#004b5e' -- additional midtone

for h, c in pairs({
  include = green,
  namespace = base1,
  string = cyan,
  ['punctuation.bracket'] = base1,
  parameter = base1,
}) do
  -- TODO: clear background on @parameter, others?
  vim.api.nvim_set_hl(0, '@' .. h, { fg = c })
end
