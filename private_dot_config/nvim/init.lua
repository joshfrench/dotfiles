local plugins_path = vim.fn.stdpath("data") .. "/lazy"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- bootstrap hotpot so we can use fennel before/while lazy is loading plugins
local hotpot_path = plugins_path .. "/hotpot.nvim"
if not vim.loop.fs_stat(hotpot_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/rktjmp/hotpot.nvim.git",
    hotpot_path,
  })
end
vim.opt.runtimepath:prepend(hotpot_path)

require 'user.settings'

require('hotpot')

require('lazy').setup({
  {
    'rktjmp/hotpot.nvim',
    opts = {
      provide_require_fennel = true,
      compiler = {
        modules = {
          correlate = true,
        },
      },
    },
  },
  { import = 'plugins' }
}, {
  install = { colorscheme = { 'solarized' } }
})

require 'user.filetype'
require 'user.codelens'
require 'user.keymap'
require 'user.lsp'
require 'user.misc'
require 'user.spelling'
require 'user.typos'
require 'user.user_commands'
require 'user.yank'
require 'user.scheme_overrides'

pcall(require, 'user.posit')
