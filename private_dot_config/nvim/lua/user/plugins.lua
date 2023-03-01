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
      -- 'p00f/nvim-ts-rainbow', -- unmaintained
      -- 'mrjones2014/nvim-ts-rainbow', -- mainline
      'HiPhish/nvim-ts-rainbow2', -- active fork
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
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
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
  use 'onsails/lspkind.nvim'
  use 'stevearc/aerial.nvim'
  use 'LunarWatcher/auto-pairs'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'b3nj5m1n/kommentary'
  use 'kosayoda/nvim-lightbulb'
  use 'weilbith/nvim-code-action-menu'
  use 'machakann/vim-sandwich'
  use 'christoomey/vim-tmux-navigator'
  use 'tpope/vim-unimpaired'
  use 'norcalli/nvim-colorizer.lua'
  use 'chentoast/marks.nvim'

  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/nvim-dap-ui'
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'

  use { 'rafcamlet/nvim-luapad' }

  use 'kchmck/vim-coffee-script'

  use 'luukvbaal/statuscol.nvim'

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
