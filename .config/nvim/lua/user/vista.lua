vim.keymap.set('n', '<C-t>', ':Vista!!<CR>', {silent = true})
vim.g.vista_default_executive = 'ctags' -- LSP does not support tree view :/
vim.g.vista_blink = {1, 100}
vim.g.vista_disable_statusline = 1
vim.g['vista#renderer#icons'] = {interface = 'כֿ', struct = '', methodspec = '', member = ''}
