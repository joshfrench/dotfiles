local packer_sync = vim.api.nvim_create_augroup('packer_sync', {clear = true})
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'init.lua',
  group = packer_sync,
  desc = 'Reload plugins on save',
  command = 'source <afile> | PackerSync',
})

require 'user.settings'
require 'user.plugins'
require 'user.colorscheme'
require 'user.keymap'

require 'user.typos'
require 'user.nvim-tree'
require 'user.treesitter'
require 'user.cmp'
require 'user.lualine'
require 'user.autopairs'
require 'user.gitsigns'
require 'user.comment'
