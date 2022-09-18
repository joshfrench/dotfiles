local ok, icons = pcall(require, "nvim-web-devicons")
if not ok then
  return
end

local colors = require('user.colorscheme')

icons.setup({
  override = {
    gcfg = {
      icon = '',
      color = colors.base2,
      cterm_color = '231',
      name = 'GCFG',
    },
    dockerfile = {
      color = colors.blue,
      cterm_color = 2,
      name = "Dockerfile",
      icon = "",
    },
  }
})
