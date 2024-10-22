return {
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
  -- { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  --[[ {
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast'
  }, ]]
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { auto_trigger = true }
      })
    end,
  },
  {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup({
        date_format = '%r',
        delay = 250,
        highlight_group = 'Gitblame'
      })
    end
  },
  {
    'IndianBoy42/tree-sitter-just',
  },
  --[[
  {
    -- TODO: change default bindings, fuckin with my <leader>e
    'Olical/conjure',
    ft = { 'fennel', 'clojure' },
  },
  --]]
}
