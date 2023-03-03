return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
    sources = {
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.formatting.prettierd,
      -- null_ls.builtins.formatting.black,
      -- null_ls.builtins.diagnostics.flake8,
      null_ls.builtins.formatting.autopep8.with({ -- match team pycharm
        generator_opts = {
          command = 'autopep8',
          to_stdin = true,
          args = require('null-ls.helpers').range_formatting_args_factory({
            '--max-line-length',
            '200',
            '-',
          },
            '--line-range',
            nil,
            { use_rows = true }),
        },
      }),
    },
    })
  end,
}
