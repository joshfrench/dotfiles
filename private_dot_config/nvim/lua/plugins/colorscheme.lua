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
    vim.api.nvim_set_hl(0, 'Gitblame', { italic = true, bg = colors.base02, fg = colors.base01 })
    vim.api.nvim_set_hl(0, 'Whitespace', { fg = colors.highlite })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = colors.base02 })

    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
    vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = colors.red, bg = colors.base02 })
    vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = colors.yellow, bg = colors.base02 })
    vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = colors.blue, bg = colors.base02 })
    vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = colors.base3, bg = colors.base02 })
    vim.api.nvim_set_hl(0, 'DiagnosticSignOk', { fg = colors.green, bg = colors.base02 })

    vim.api.nvim_set_hl(0, 'LspReferenceText', { bold = true, bg = colors.highlite })
    vim.api.nvim_set_hl(0, 'LspReferenceRead', { bold = true, bg = colors.highlite })
    vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bold = true, bg = colors.highlite })
    vim.api.nvim_set_hl(0, 'LspCodeLens', { italic = true, fg = colors.base01 })
    vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', { italic = true, fg = colors.base01 })

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
