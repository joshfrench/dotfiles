return {
  {
    'ishan9299/nvim-solarized-lua',
    init = function()
      vim.cmd('colorscheme solarized')
    end
  },
  'norcalli/nvim-colorizer.lua',
  'christoomey/vim-tmux-navigator',
  'tpope/vim-unimpaired',
  {
    'rafcamlet/nvim-luapad',
    cmd = { 'Luapad', 'LuaRun' },
  },
  {
    'kchmck/vim-coffee-script',
    ft = 'coffeescript',
    init = function()
      vim.cmd [[ hi link coffeeSpaceError NONE ]]
      vim.cmd [[ hi link coffeeSemicolonError NONE ]]
    end
  },
  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
  },
  'cpea2506/relative-toggle.nvim',
  --[[
  {
    -- TODO: change default bindings, fuckin with my <leader>e
    'Olical/conjure',
    ft = { 'fennel', 'clojure' },
  },
  --]]
}
