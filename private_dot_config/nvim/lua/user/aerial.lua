local ok, aerial = pcall(require, 'aerial')
if not ok then
  return
end

aerial.setup({
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
})

vim.keymap.set('n', '<C-t>', '<cmd>AerialToggle<CR>', { silent = true })
