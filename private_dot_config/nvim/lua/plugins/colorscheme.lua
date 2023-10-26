return {
  'ishan9299/nvim-solarized-lua',
  init = function()
    vim.cmd('colorscheme solarized')
    local colors = require('user.colors')

    -- override some yuck
    for h, c in pairs({
      ['@include'] = colors.green,
      ['@namespace'] = colors.base1,
      ['@string'] = colors.cyan,
      ['@punctuation.bracket'] = colors.base1,
      ['@parameter'] = colors.base1,
    }) do
      vim.api.nvim_set_hl(0, h, { fg = c })
    end

    vim.api.nvim_set_hl(0, '@constructor', {})

    vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = colors.yellow })
    vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = colors.blue })
    vim.api.nvim_set_hl(0, 'NeoTreeGitUnstaged', { fg = colors.yellow })
    vim.api.nvim_set_hl(0, 'NeoTreeGitStaged', { fg = colors.green })
    vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = colors.green })
    vim.api.nvim_set_hl(0, 'NeoTreeModifiedSymbol', { fg = colors.blue })
    vim.api.nvim_set_hl(0, 'NeoTreeTabActive', { fg = colors.base2, bg = colors.base02 })
    vim.api.nvim_set_hl(0, 'NeoTreeTabSeparatorActive', { fg = colors.base01, bg = colors.base02 })
    vim.api.nvim_set_hl(0, 'NeoTreeTabInactive', { fg = colors.base00, bg = colors.base03 })
    vim.api.nvim_set_hl(0, 'NeoTreeTabSeparatorInactive', { fg = colors.base01, bg = colors.base03 })
    vim.api.nvim_set_hl(0, 'MatchParen', { bold = true, bg = colors.highlite })
    -- vim.api.nvim_set_hl(0, 'MatchParen', { reverse = true })

    -- map semantic highlight groups
    local links = {
      ['@lsp.type.namespace'] = '@namespace',
      ['@lsp.type.type'] = '@type',
      ['@lsp.type.class'] = '@type',
      ['@lsp.type.enum'] = '@type',
      ['@lsp.type.interface'] = '@type',
      ['@lsp.type.struct'] = 'Structure',
      ['@lsp.type.parameter'] = '@parameter',
      ['@lsp.type.variable'] = '@variable',
      ['@lsp.type.property'] = '@property',
      ['@lsp.type.enumMember'] = '@constant',
      ['@lsp.type.function'] = '@function',
      ['@lsp.type.method'] = '@method',
      ['@lsp.type.macro'] = '@macro',
      ['@lsp.type.decorator'] = '@function',
    }
    for newgroup, oldgroup in pairs(links) do
      vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
    end
  end
}
