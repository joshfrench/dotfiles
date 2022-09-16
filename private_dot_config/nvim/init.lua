local au = vim.api.nvim_create_augroup('packer_sync', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'init.lua',
  group = au,
  desc = 'Reload plugins on save',
  command = 'source <afile> | PackerSync',
})

require 'user.settings'
require 'user.plugins'
require 'user.colorscheme'
require 'user.keymap'

require 'user.typos'
require 'user.formatting'
require 'user.treesitter'
require 'user.cmp'
require 'user.lsp'
require 'user.null-ls'
require 'user.devicons'
require 'user.nvim-tree'
require 'user.telescope'
require 'user.lualine'
require 'user.vista'
require 'user.autopairs'
require 'user.gitsigns'
require 'user.trouble'
require 'user.comment'
require 'user.sandwich'
require 'user.spelling'
require 'user.navic'
require 'user.lightbulb'
require 'user.code_actions'
require 'user.indent_blankline'
require 'user.yank'
require 'user.close'
require 'user.filetype'
require 'user.yaml'
require 'user.user_commands'
require 'user.winbar'
