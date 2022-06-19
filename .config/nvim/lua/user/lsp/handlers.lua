local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
  M.capabilities = cmp_lsp.update_capabilities(M.capabilities)
end

local ok, status = pcall(require, 'lsp-status')
if ok then
  status.config({
    show_filename = false,
    diagnostics = false,
  })
  status.register_progress()
  M.capabilities = vim.tbl_extend('keep', M.capabilities, status.capabilities)
end

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", sign = "" },
    { name = "DiagnosticSignWarn",  sign = "" },
    { name = "DiagnosticSignHint",  sign = "" },
    { name = "DiagnosticSignInfo",  sign = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.sign})
  end

  vim.diagnostic.config({
    virtual_text = false,
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

local function lsp_highlight_doc(client, bufnr)
  if client.resolved_capabilities.document_highlight then
    local au = vim.api.nvim_create_augroup('lsp_doc_highlight', {clear = true})
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

local function lsp_keymap(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

local function lsp_status(client)
  status.on_attach(client)
end

M.on_attach = function(client, bufnr)
  lsp_highlight_doc(client, bufnr)
  lsp_keymap(bufnr)
  lsp_status(client)
end

return M
