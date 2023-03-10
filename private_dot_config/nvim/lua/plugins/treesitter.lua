return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    -- 'p00f/nvim-ts-rainbow', -- unmaintained
    -- 'mrjones2014/nvim-ts-rainbow', -- mainline
    'HiPhish/nvim-ts-rainbow2', -- active fork
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/playground',
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash', 'dockerfile', 'go', 'gomod', 'gotmpl', 'javascript', 'json', 'lua',
      'make', 'markdown', 'markdown_inline', 'regex', 'ruby', 'terraform', 'toml',
      'tsx', 'typescript', 'python', 'rust', 'vim', 'yaml'
    },
    highlight = {
      enabled = true,
      additional_vim_regex_highlighting = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
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
  },
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
      TSRainbowRed = colors.red,
      TSRainbowYellow = colors.yellow,
      TSRainbowBlue = colors.blue,
      TSRainbowOrange = colors.orange,
      TSRainbowGreen = colors.green,
      TSRainbowViolet = colors.violet,
      TSRainbowCyan = colors.cyan,
    }) do
      vim.api.nvim_set_hl(0, hl, { fg = color })
    end
  end
}
