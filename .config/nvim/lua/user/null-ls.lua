local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.shellcheck,
    -- null_ls.builtins.diagnostics.zsh,

    null_ls.builtins.code_actions.gitsigns,
  },
})
