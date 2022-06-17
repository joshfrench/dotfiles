local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

treesitter.setup({
  ensure_installed = {'bash', 'json', 'lua', 'markdown', 'vim'},
  highlight = {
    enabled = true,
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = { '#268bd2', '#2aa198', '#859900', '#b58900', '#cb4b16', '#6c71c4', },
  },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.indentexpr = 'treesitter#indentexpr()'
