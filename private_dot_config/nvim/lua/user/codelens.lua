local au = vim.api.nvim_create_augroup('codelens_refresh', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = au,
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.supports_method("textDocument/codeLens") then
      vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
        group = au,
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })
      vim.keymap.set('n', '<leader>c', vim.lsp.codelens.run, { noremap = true, silent = true, buffer = bufnr })
    end
  end
})
