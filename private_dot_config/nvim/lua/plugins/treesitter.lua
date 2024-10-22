return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash', 'dockerfile', 'fennel', 'go', 'gomod', 'gotmpl', 'javascript', 'json',
        'lua', 'make', 'markdown', 'markdown_inline', 'query', 'regex', 'ruby',
        'terraform', 'toml', 'tsx', 'typescript', 'python', 'rust', 'vim', 'yaml'
      },
      indent = {
        enabled = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
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
  end,
  init = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.indentexpr = 'treesitter#indentexpr()'

    local configs = require('nvim-treesitter.parsers').get_parser_configs()

    configs.gotmpl = {
      install_info = {
        url = "https://github.com/dannylongeuay/tree-sitter-go-template",
        files = { "src/parser.c" }
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl" }
    }

    vim.g.skip_ts_context_commentstring_module = true
  end
}
