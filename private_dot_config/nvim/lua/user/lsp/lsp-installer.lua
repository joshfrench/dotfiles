local ok, lspinstaller = pcall(require, 'nvim-lsp-installer')
if not ok then
  return
end

lspinstaller.setup({
  ensure_installed = {
    'bashls',
    'eslint',
    'gopls',
    'jsonls',
    'pyright',
    'sumneko_lua',
    'tsserver',
    'yamlls'
  },
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  },
})
