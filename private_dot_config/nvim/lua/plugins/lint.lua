local lint = require 'lint'

lint.linters_by_ft = {
  terraform = { 'tflint' },
  ['terraform-vars'] = { 'tflint' },
}

vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    lint.try_lint()
  end,
})
