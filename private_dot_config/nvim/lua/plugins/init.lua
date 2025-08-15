return {
  'christoomey/vim-tmux-navigator',
  'cpea2506/relative-toggle.nvim',
  'cpea2506/relative-toggle.nvim',
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
}
