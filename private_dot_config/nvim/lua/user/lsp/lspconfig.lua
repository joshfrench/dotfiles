local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

for _, server in ipairs(require 'nvim-lsp-installer'.get_installed_servers()) do
  local opts = {
    capabilities = require 'user.lsp.handlers'.capabilities,
  }

  local ok, server_opts = pcall(require, "user.lsp.settings." .. server.name)
  if ok then
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  lspconfig[server.name].setup(opts)
end
