local recipes = vim.fn.deepcopy(vim.g['sandwich#default_recipes'])
local buns = { ['('] = ')', ['['] = ']', ['{'] = '}' }

for o, c in pairs(buns) do
  recipes[#recipes + 1] = {
    buns = { o .. ' ', ' ' .. c },
    nesting = 1, match_syntax = 1,
    kind = { 'add', 'replace' }, action = { 'add' },
    input = { o }
  }
  recipes[#recipes + 1] = {
    buns = { o .. '\\s*', '\\s*' .. c },
    nesting = 1, regex = 1, match_syntax = 1,
    kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' },
    input = { o, c }
  }
end

vim.g['sandwich#recipes'] = recipes
