return {
  'LunarWatcher/auto-pairs',
  init = function()
    vim.g.AutoPairsCompatibleMaps = 0
    vim.g.AutoPairsMapBS = 1
    vim.g.AutoPairsMultilineBackspace = 1
    -- https://github.com/LunarWatcher/auto-pairs/issues/34
    vim.g.AutoPairsFiletypeBlacklist = { 'TelescopePrompt' }
    local au = vim.api.nvim_create_augroup('autopairs', { clear = true })
    vim.api.nvim_create_autocmd('Filetype', {
      pattern = 'TelescopePrompt',
      group = au,
      callback = function() vim.b.autopairs_enabled = false end
    })
  end
}
