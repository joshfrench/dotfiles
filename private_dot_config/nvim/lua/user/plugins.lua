local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
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
  use 'ishan9299/nvim-solarized-lua'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'p00f/nvim-ts-rainbow',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/playground',
    },
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'dcampos/nvim-snippy',
      'dcampos/cmp-snippy',
    },
  }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use { "~/src/joshfrench/yaml-companion.nvim/" }
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      }
    }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
  }
  use {
    'folke/trouble.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
  }
  use 'liuchengxu/vista.vim'
  use 'LunarWatcher/auto-pairs' -- TODO: get on 4.0.0?
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'SmiteshP/nvim-navic'
  use 'b3nj5m1n/kommentary'
  use 'kosayoda/nvim-lightbulb'
  use 'weilbith/nvim-code-action-menu'
  use 'machakann/vim-sandwich'
  use 'christoomey/vim-tmux-navigator'
  use 'tpope/vim-unimpaired'

  use { 'rafcamlet/nvim-luapad', requires = "antoinemadec/FixCursorHold.nvim" }

  use 'kchmck/vim-coffee-script'

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
