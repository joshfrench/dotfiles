-- do what i mean, not what i type

vim.api.nvim_create_user_command('E', 'e<bang> <args>', {bang=true, complete='file',nargs='*'})
vim.api.nvim_create_user_command('W', 'w<bang> <args>', {bang=true, complete='file',nargs='*'})
vim.api.nvim_create_user_command('Wq', 'wq<bang> <args>', {bang=true, complete='file',nargs='*'})
vim.api.nvim_create_user_command('WQ', 'wq<bang> <args>', {bang=true, complete='file', nargs='*'})
vim.api.nvim_create_user_command('Q', 'q<bang>', {bang=true})
vim.api.nvim_create_user_command('Qa', 'qa<bang>', {bang=true})
vim.api.nvim_create_user_command('QA', 'qa<bang>', {bang=true})
vim.api.nvim_create_user_command('Bd', 'bd<bang> <args>', {bang=true, nargs='*', complete='buffer'})
vim.api.nvim_create_user_command('BD', 'bd<bang> <args>', {bang=true, nargs='*', complete='buffer'})
vim.cmd [[cmap Tabe tabe]]
