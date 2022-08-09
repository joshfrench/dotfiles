vim.g.AutoPairsCompatibleMaps = 0
vim.g.AutoPairsMapBS = 1
vim.g.AutoPairsMultilineBackspace = 1
vim.g.AutoPairsFiletypeBlacklist = {'TelescopePrompt'}

-- https://github.com/LunarWatcher/auto-pairs/issues/34
local au = vim.api.nvim_create_augroup('autopairs', {clear = true})
vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'TelescopePrompt',
  group = au,
  callback = function() vim.b.autopairs_enabled = false end
})

--[[ let g:AutoPairs = autopairs#AutoPairsDefine([
    {"open":"\w\zs<", "close":">", "filetype":"typescript"}
]) ]]
