return {
  'chentoast/marks.nvim',
  init = function()
    local colors = require('user.colors')
    vim.api.nvim_set_hl(0, 'MarkSignHL', { fg = colors.blue, bg = colors.base02 })
  end
}
