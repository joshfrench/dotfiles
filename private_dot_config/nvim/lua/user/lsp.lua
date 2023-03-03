local border_style = 'rounded';

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = border_style, }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = border_style, }
)

local signs = {
  { name = "DiagnosticSignError", sign = "" },
  { name = "DiagnosticSignWarn",  sign = "" },
  { name = "DiagnosticSignHint",  sign = "" },
  { name = "DiagnosticSignInfo",  sign = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.sign })
end

local colors = require('user.colors')
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = colors.red, bg = colors.base02 })
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = colors.yellow, bg = colors.base02 })
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = colors.blue, bg = colors.base02 })
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = colors.base3, bg = colors.base02 })
vim.api.nvim_set_hl(0, 'DiagnosticSignOk', { fg = colors.green, bg = colors.base02 })

vim.api.nvim_set_hl(0, 'LspReferenceText', { bold = true, bg = colors.highlite })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bold = true, bg = colors.highlite })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bold = true, bg = colors.highlite })
vim.api.nvim_set_hl(0, 'LspCodeLens', { italic = true, fg = colors.base01 })
vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', { italic = true, fg = colors.base01 })

vim.diagnostic.config({
  virtual_text = true,
  signs = { active = true },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    border = border_style,
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
    -- style = 'minimal',
    source = 'if_many',
    scope = 'cursor',
  }
})

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
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'BufLeave', 'InsertEnter', 'FocusLost' }, {
        group = au,
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references
      })
    end
  end
})

local function open_diagnostic_or_docs()
  local float, _ = vim.diagnostic.open_float();
  if (float == nil) then
    vim.lsp.buf.hover()
  end
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = au,
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', open_diagnostic_or_docs, opts)
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
