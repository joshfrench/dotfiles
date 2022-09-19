local ok, icons = pcall(require, "nvim-web-devicons")
if not ok then
  return
end

local colors = require('user.colorscheme')

local custom = {
  gcfg = {
    icon = '',
    color = colors.base2,
    cterm_color = '231',
    name = 'GCFG',
  },
  Dockerfile = { color = colors.blue },
  [".gitignore"] = { color = colors.red },
  COMMIT_EDITMSG = { color = colors.yellow },
}

local all = icons.get_icons()
local overrides = {}
for name, update in pairs(custom) do
  local default = all[name] or {}
  overrides[name] = vim.tbl_deep_extend("force", default, update)
end

icons.setup({
  override = overrides
})
