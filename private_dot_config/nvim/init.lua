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

require('lazy').setup({
  { import = 'plugins' }
}, {
  install = { colorscheme = { 'solarized' } },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      }
    }
  }
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

pcall(require, 'user.posit')
