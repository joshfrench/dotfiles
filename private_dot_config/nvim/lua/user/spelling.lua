local au = vim.api.nvim_create_augroup('spelling', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'markdown', 'md', 'txt'},
  group = au,
  callback = function() vim.opt_local.spell = true end
})
