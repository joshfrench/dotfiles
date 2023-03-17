return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'HiPhish/nvim-ts-rainbow2', -- active fork
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/playground',
  },
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
      rainbow = {
        enable = true,
        extended_mode = true,
        hlgroups = {
          'TSRainbowPlain',
          'TSRainbowBlue',
          'TSRainbowCyan',
          'TSRainbowViolet',
          'TSRainbowRed',
          'TSRainbowOrange',
          'TSRainbowYellow',
          'TSRainbowGreen',
        },
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
    local configs = require('nvim-treesitter.parsers').get_parser_configs()

    configs.gotmpl = {
      install_info = {
        url = "https://github.com/dannylongeuay/tree-sitter-go-template",
        files = { "src/parser.c" }
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl" }
    }

    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.indentexpr = 'treesitter#indentexpr()'

    local colors = require('user.colors')
    for hl, color in pairs({
      TSRainbowPlain = colors.base1,
      TSRainbowCyan = colors.cyan,
      TSRainbowViolet = colors.violet,
      TSRainbowRed = colors.red,
      TSRainbowOrange = colors.orange,
      TSRainbowYellow = colors.yellow,
      TSRainbowGreen = colors.green,
      TSRainbowBlue = colors.blue,
    }) do
      vim.api.nvim_set_hl(0, hl, { fg = color })
    end
  end
}
