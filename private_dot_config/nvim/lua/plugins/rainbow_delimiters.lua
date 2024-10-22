return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    local colors = require('user.colors')
    for hl, color in pairs({
      TSRainbowPlain = colors.base1,
      TSRainbowCyan = colors.cyan,
      TSRainbowViolet = colors.violet,
      TSRainbowRed = colors.red,
      TSRainbowOrange = colors.orange,
      TSRainbowYellow = colors.yellow,
      TSRainbowGreen = colors.green,
      TSRainbowBlue = colors.blue,
    }) do
      vim.api.nvim_set_hl(0, hl, { fg = color })
    end

    vim.g.rainbow_delimiters = {
      highlight = {
        'TSRainbowPlain',
        'TSRainbowBlue',
        'TSRainbowCyan',
        'TSRainbowViolet',
        'TSRainbowRed',
        'TSRainbowOrange',
        'TSRainbowYellow',
        'TSRainbowGreen',
      }
    }
  end
}
