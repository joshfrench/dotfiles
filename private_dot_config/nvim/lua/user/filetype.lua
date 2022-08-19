local au = vim.api.nvim_create_augroup('gcfg_filetype', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.gcfg',
  group = au,
  callback = function()
    vim.opt_local.commentstring = '; %s'
    vim.opt_local.syntax = 'cfg'
  end
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.gotmpl',
  group = au,
  callback = function()
    vim.cmd[[TSBufEnable highlight]]
  end
})
