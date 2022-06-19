vim.keymap.set('n', '<C-t>', ':Vista!!<CR>', {silent = true})
vim.g.vista_default_executive = 'ctags' -- LSP does not support tree view :/
vim.g.vista_blink = {1, 100}
vim.g.vista_disable_statusline = 1
vim.g['vista#renderer#icons'] = {interface = 'כֿ', struct = '', methodspec = '', member = ''}

-- TODO: sync icons w/ navic
--[[ local icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = ""
} ]]
