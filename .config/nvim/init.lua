vim.cmd [[
  augroup packer_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

require 'user.options'
require 'user.plugins'
require 'user.colorscheme'
require 'user.keymap'

require 'user.plugins.nvim-tree'
