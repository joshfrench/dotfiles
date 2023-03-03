return {
  'stevearc/aerial.nvim',
  opts = {
    backends = { ['_'] = { 'lsp', 'treesitter' } }, -- default; pass filetypes as keys to override per type
    default_direction = 'prefer_right',
    keymaps = {
      ["<space>"] = "actions.tree_toggle"
    },
    highlight_on_hover = true,
    filter_kind = {
      'Class',
      'Constant',
      'Constructor',
      'Enum',
      'EnumMember',
      'Field',
      'Function',
      'Interface',
      'Method',
      'Module',
      'Object',
      -- 'Package',
      'Property',
      'Struct',
    }
  },
  init = function()
    vim.keymap.set('n', '<C-t>', '<cmd>AerialToggle<CR>', { silent = true })
    vim.api.nvim_set_hl(0, 'AerialLine', { bold = true, bg = require('user.colors').highlite })
  end
}
