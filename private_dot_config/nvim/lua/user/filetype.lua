local gcfg = vim.api.nvim_create_augroup('gcfg_filetype', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.gcfg',
  group = gcfg,
  callback = function()
    vim.opt_local.commentstring = '; %s'
    vim.opt_local.syntax = 'cfg'
  end
})

local gotmpl = vim.api.nvim_create_augroup('gotmpl_filetype', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.gotmpl',
  group = gotmpl,
  callback = function()
    vim.cmd [[TSBufEnable highlight]]
  end
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.yaml',
  group = gotmpl,
  callback = function()
    if vim.fn.search('{{[- ][.].* }}', 'nw') > 0 then
      vim.opt_local.filetype = 'gotmpl'
      vim.cmd [[TSBufEnable highlight]]
    end
  end
})
