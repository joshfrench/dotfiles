local M = {}

local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

local rename = {
  name = "rename",
  method = null_ls.methods.CODE_ACTION,
  filetypes = {},
  generator = {
    async = true,
    fn = function(params, done)
      local lspParams = {
        textDocument = { uri = vim.uri_from_bufnr(params.bufnr) },
        position = { line = params.row, character = params.col },
      }
      vim.lsp.buf_request(params.bufnr, "textDocument/prepareRename", lspParams, function(_, result)
        if result ~= nil then
          return done({ {
            title = 'Rename',
            action = vim.lsp.buf.rename,
          } })
        else
          return done()
        end
      end)
    end
  }
}

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.shellcheck,
    -- null_ls.builtins.diagnostics.zsh,
    null_ls.builtins.code_actions.gitsigns,
  },
})

M.attach = function(client)
  if client.resolved_capabilities.rename then
    if not null_ls.is_registered('rename') then
      null_ls.register(rename)
    end
    null_ls.enable('rename')
  else
    null_ls.disable('rename')
  end
end

return M -- for use by user.lsp.handlers
