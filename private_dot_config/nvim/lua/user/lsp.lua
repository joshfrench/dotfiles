vim.lsp.enable({
  'lua_ls',
  'gopls',
  'yaml_language_server',
})

vim.lsp.config('*',
  --- @type vim.lsp.Config
  {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    root_markers = { '.git' },
  }
)

vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#586e75', italic = true })

vim.diagnostic.config({
  virtual_text = true,
  -- virtual_lines = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
  float = {
    focusable = false,
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
    source = 'if_many',
    scope = 'cursor',
  }
})

local function open_diagnostic_or_docs()
  local float, _ = vim.diagnostic.open_float();
  if (float == nil) then
    vim.lsp.buf.hover()
  end
end


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', 'K', open_diagnostic_or_docs, { noremap = true, silent = true, buffer = event.buf })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, buffer = event.buf })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, silent = true, buffer = event.buf })

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentSymbol, event.buf) then
      require('nvim-navic').attach(client, event.buf)
    end

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = true })

      ---@diagnostic disable-next-line: param-type-mismatch
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      ---@diagnostic disable-next-line: param-type-mismatch
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_formatting, event.buf) then
      vim.b.format = 1
      ---@diagnostic disable-next-line: param-type-mismatch
      vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePre' }, {
        group = vim.api.nvim_create_augroup('lsp-format', { clear = true }),
        buffer = event.buf,
        callback = function(ev)
          if vim.b.format == 1 then
            vim.lsp.buf.format({ id = client.id, async = ev.event == 'InsertLeave' })
          end
        end
      })
    end
  end
})
