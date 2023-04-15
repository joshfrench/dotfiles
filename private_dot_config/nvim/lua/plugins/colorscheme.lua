return {
  'ishan9299/nvim-solarized-lua',
  init = function()
    vim.cmd('colorscheme solarized')
    local colors = require('user.colors')

    -- override some yuck
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

    vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = colors.blue })
    vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = colors.yellow })
    vim.api.nvim_set_hl(0, 'NeoTreeGitUnstaged', { fg = colors.yellow })
    vim.api.nvim_set_hl(0, 'NeoTreeGitStaged', { fg = colors.green })
    vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = colors.green })
    vim.api.nvim_set_hl(0, 'NeoTreeModifiedSymbol', { fg = colors.red })
    vim.api.nvim_set_hl(0, 'NeoTreeTabActive', { fg = colors.base2, bg = colors.base03 })
    vim.api.nvim_set_hl(0, 'NeoTreeTabSeparatorActive', { bg = colors.base03, fg = colors.base01 })
    vim.api.nvim_set_hl(0, 'NeoTreeTabInactive', { fg = colors.base00, bg = colors.base03 })
    vim.api.nvim_set_hl(0, 'NeoTreeTabSeparatorInactive', { bg = colors.base03, fg = colors.base01 })
  end
}
