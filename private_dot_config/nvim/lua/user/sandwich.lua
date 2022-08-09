-- '(' inserts pairs with padding, ')' inserts pair with no padding
-- surround.vim style mappings
-- |foo + sae( -> ( foo )
-- |foo + sae) -> (foo)

local recipes = vim.fn.deepcopy(vim.g['sandwich#default_recipes'])

local buns = {
  ['('] = ')',
  ['['] = ']',
  ['{'] = '}',
}

for o,c in pairs(buns) do
  recipes[#recipes+1] = {
    buns = {o..' ', ' '..c}, -- {'( ', ' )'}
    nesting = 1, match_syntax = 1,
    kind = {'add', 'replace'},
    action = {'add'},
    input = {o}
  }
  recipes[#recipes+1] = {
    buns = {o..'\\s*', '\\s*'..c}, -- {'(\s*', '\s*)'}
    nesting = 1, regex = 1, match_syntax = 1,
    kind = {'delete', 'replace', 'textobj'},
    action = {'delete'},
    input = {o,c} -- use either char to delete regardless of padding
  }
end

vim.g['sandwich#recipes'] = recipes
