return {
  'lukas-reineke/indent-blankline.nvim',
  opts = { space_char_blankline = ' ', },
  config = function()
    local colors = require('user.colors')
    vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = colors.base02 })
  end
}
