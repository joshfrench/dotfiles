require 'user.settings'

-- Build hooks
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.kind == 'delete' then return end
    if ev.data.spec.name == 'nvim-treesitter' then
      vim.schedule(function() vim.cmd('TSUpdate') end)
    elseif ev.data.spec.name == 'CopilotChat.nvim' then
      vim.system({ 'make', 'tiktoken' }, { cwd = ev.data.path })
    end
  end,
})

-- Colorscheme (must load first)
vim.pack.add({ 'https://github.com/ishan9299/nvim-solarized-lua' })
require 'plugins.colorscheme'

-- Core plugins (no config needed)
vim.pack.add({
  'https://github.com/christoomey/vim-tmux-navigator',
  'https://github.com/cpea2506/relative-toggle.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/kyazdani42/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
})

-- Treesitter
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
require 'plugins.treesitter'

-- Git
vim.pack.add({ 'https://github.com/f-person/git-blame.nvim' })
require 'plugins.git_blame'

vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })
require 'plugins.gitsigns'

-- UI
vim.pack.add({ 'https://github.com/lukas-reineke/indent-blankline.nvim' })
require 'plugins.indent_blankline'

vim.pack.add({ 'https://github.com/chentoast/marks.nvim' })
require 'plugins.marks'

vim.pack.add({ 'https://github.com/luukvbaal/statuscol.nvim' })
require 'plugins.statuscol'

vim.pack.add({ 'https://github.com/HiPhish/rainbow-delimiters.nvim' })
require 'plugins.rainbow_delimiters'

vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' })
require 'plugins.lualine'

-- Editing
vim.pack.add({ 'https://github.com/machakann/vim-sandwich' })
require 'plugins.sandwich'

vim.pack.add({ 'https://github.com/altermo/ultimate-autopair.nvim' })
require 'plugins.autopairs'

-- Navigation
vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })
require 'plugins.fzf_lua'

vim.pack.add({
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = 'v3.x' },
})
require 'plugins.neo_tree'

-- Copilot
vim.pack.add({
  'https://github.com/zbirenbaum/copilot.lua',
  'https://github.com/CopilotC-Nvim/CopilotChat.nvim',
})
require 'plugins.copilot'

-- Completion
vim.pack.add({
  'https://github.com/moyiz/blink-emoji.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.0') },
})
require 'plugins.blink'

-- User config
require 'user.keymap'
require 'user.lsp'
require 'user.spelling'
require 'user.typos'
require 'user.commands'
require 'user.yank'
