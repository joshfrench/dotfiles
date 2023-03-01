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
    'bash', 'dockerfile', 'go', 'gomod', 'gotmpl', 'javascript', 'json', 'lua',
    'make', 'markdown', 'ruby', 'terraform', 'toml', 'tsx', 'typescript', 'python',
    'rust', 'vim', 'yaml'
  },
  highlight = {
    enabled = true,
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = { '#268bd2', '#2aa198', '#859900', '#b58900', '#cb4b16', '#6c71c4', }, -- actually set in nvim-treesitter config
  },
  context_commentstring = {
    enable = true,
  },
  playground = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.indentexpr = 'treesitter#indentexpr()'
