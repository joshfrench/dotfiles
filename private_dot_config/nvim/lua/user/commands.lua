vim.api.nvim_create_user_command('Mdp', 'silent !macdown %', { bang = true })

-- toggle LSP autoformat
vim.api.nvim_create_user_command('Format', 'let b:format=1', {})
vim.api.nvim_create_user_command('NoFormat', 'let b:format=0', {})
