local keys = vim.keymap

-- tab navigation
keys.set('n', '<S-H>', 'gT')
keys.set('n', '<S-L>', 'gt')

-- toggle hlsearch
keys.set('n', '<leader><space>', ':set invhlsearch<CR>', {silent = true})

-- paste
keys.set('i', '<leader>p', '<C-O>:set invpaste<CR>')

-- tabshift without exiting Visual
keys.set('v', '<', '<gv')
keys.set('v', '>', '>gv')

-- repeat operator in Visual
keys.set('v', '.', ':normal .<CR>')

-- delete in Visual
keys.set('v', '<BS>', 'x')

-- search w/regexps by default
keys.set({'n', 'v'}, '/', '/\\v')

-- go to buffer menu with prompt
keys.set('n', '<leader>B', ':ls<CR>:b')

-- move lines
keys.set('n', '<M-j>', ':m .+1<CR>==')
keys.set('n', '<M-k>', ':m .-2<CR>==')
keys.set('i', '<M-j>', '<ESC>:m .+1<CR>==gi')
keys.set('i', '<M-k>', '<ESC>:m .-2<CR>==gi')
keys.set('v', '<M-j>', ":m '>+1<CR>gv=gv")
keys.set('v', '<M-k>', ":m '<-2<CR>gv=gv")
