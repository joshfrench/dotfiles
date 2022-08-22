local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

local configs = require('nvim-treesitter.parsers').get_parser_configs()

configs.gotmpl = {
  install_info = {
    url = "https://github.com/dannylongeuay/tree-sitter-go-template",
    files = { "src/parser.c" }
  },
  filetype = "gotmpl",
  used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl" }
}

treesitter.setup({
  ensure_installed = {
    'bash', 'dockerfile', 'go', 'gomod', 'gotmpl', 'javascript', 'json',
    'lua', 'markdown', 'toml', 'tsx', 'typescript', 'python', 'vim', 'yaml'
  },
  highlight = {
    enabled = true,
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = { '#268bd2', '#2aa198', '#859900', '#b58900', '#cb4b16', '#6c71c4', },
  },
  context_commentstring = {
    enable = true,
  },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.indentexpr = 'treesitter#indentexpr()'

