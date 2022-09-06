local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
  M.capabilities = cmp_lsp.update_capabilities(M.capabilities)
end

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", sign = "" },
    { name = "DiagnosticSignWarn", sign = "" },
    { name = "DiagnosticSignHint", sign = "" },
    { name = "DiagnosticSignInfo", sign = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.sign })
  end

  vim.diagnostic.config({
    virtual_text = true,
    signs = { active = true },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      source = 'if_many',
      header = 'a header',
      prefix = 'a prefix',
    }
  })
end


local au = vim.api.nvim_create_augroup('LspAttach', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = au,
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd('CursorHold', {
        group = au,
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        group = au,
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references
      })
    end
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = au,
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', 'Rn', vim.lsp.buf.rename, opts)
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = au,
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.supports_method("textDocument/formatting") then
      vim.b.format = 1
      vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePre' }, {
        group = au,
        buffer = bufnr,
        callback = function()
          if vim.b.format == 1 then -- :Format/:NoFormat to toggle
            vim.lsp.buf.format({ id = client.id, async = false })
          end
        end
      })
    end
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = au,
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.documentSymbolProvider and client.name ~= "bashls" then
      require 'nvim-navic'.attach(client, bufnr)
    end
  end
})

return M
