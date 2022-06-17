local ok, installer = pcall(require, 'nvim-lsp-installer')
if not ok then
  return
end

installer.on_server_ready(function(server)
  local opts = {
    on_attach = require'user.lsp.handlers'.on_attach,
    capabilities = require'user.lsp.handlers'.capabilities,
  }

  local ok, server_opts = pcall(require, "user.lsp.settings."..server.name)
  if ok then
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  server:setup(opts)
end)
