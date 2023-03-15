return {
  'kyazdani42/nvim-web-devicons',
  config = function()
    local icons = require('nvim-web-devicons')
    local colors = require('user.colors')

    local custom = {
      gcfg = {
        icon = '',
        color = colors.base2,
        cterm_color = '231',
        name = 'GCFG',
      },
      rs = {
        icon = "🦀"
      },
      -- Dockerfile = { color = colors.blue },
      [".gitignore"] = { color = colors.base0 },
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
  end
}
