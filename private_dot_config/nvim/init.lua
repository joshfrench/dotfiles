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

require 'user.settings'

require('lazy').setup(
  {
    { import = 'plugins' }
  },
  {
    install = { colorscheme = { 'solarized' } },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        }
      }
    }
  }
)

require 'user.keymap'
require 'user.spelling'
require 'user.typos'
require 'user.commands'
require 'user.lsp'
