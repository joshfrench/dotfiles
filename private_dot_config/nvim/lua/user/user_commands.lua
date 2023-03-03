vim.api.nvim_create_user_command('Mdp', 'silent !macdown %', { bang = true })

-- toggle LSP autoformat
vim.api.nvim_create_user_command('Format', 'let b:format=1', {})
vim.api.nvim_create_user_command('NoFormat', 'let b:format=0', {})

local function chezmoi(args)
  if args.fargs[1] == 'apply' then

  end
end

vim.api.nvim_create_user_command('Chezmoi', chezmoi, {
  nargs = '+',
  complete = function()
    return { "apply" }
  end
})
