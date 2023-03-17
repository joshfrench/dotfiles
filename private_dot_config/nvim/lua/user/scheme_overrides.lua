local colors = require('user.colors')

for h, c in pairs({
  include = colors.green,
  namespace = colors.base1,
  string = colors.cyan,
  ['punctuation.bracket'] = colors.base1,
  parameter = colors.base1,
}) do
  vim.api.nvim_set_hl(0, '@' .. h, { fg = c })
end

vim.api.nvim_set_hl(0, '@constructor', {})
