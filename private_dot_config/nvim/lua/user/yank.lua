local au = vim.api.nvim_create_augroup('yank', { clear = true })

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  pattern = '*',
  group = au,
  callback = function()
    vim.highlight.on_yank({ higroup = "HighlightedyankRegion", timeout = 400 })
  end
})
