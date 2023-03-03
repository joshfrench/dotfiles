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

require 'user.settings'
require 'user.keymap'
require 'user.typos'
require 'user.spelling'
require 'user.user_commands'
require 'user.yank'
require 'user.codelens'
require 'user.misc'

pcall(require, 'user.posit')

require('lazy').setup("plugins", {
  install = { colorscheme = { 'solarized' } }
})

require 'user.lsp'
