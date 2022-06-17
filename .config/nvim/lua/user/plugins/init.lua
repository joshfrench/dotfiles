local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local ok, packer = pcall(require, "packer")
if not ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float()
    end
  }
})

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'christoomey/vim-tmux-navigator'
  use 'ishan9299/nvim-solarized-lua'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'p00f/nvim-ts-rainbow',
    }
  }

  if packer_bootstrap then
    packer.sync()
  end

end)
