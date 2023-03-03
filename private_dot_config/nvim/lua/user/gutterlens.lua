local M = {}

M.update_codelens = function()
  for _, client in pairs(vim.lsp.buf_get_clients()) do
    if client and client.supports_method('textDocument/codeLens') then
      local lenses = vim.lsp.codelens.get(0)
      if not vim.tbl_isempty(lenses) then
        for i, lens in ipairs(lenses) do
          if not vim.tbl_isempty(lens) then
            vim.fn.sign_define('GutterLens', { text = '|>' })
            vim.fn.sign_place(i, 'gutterlens', 'GutterLens', vim.fn.bufname(0), {
              lnum = lens.range.start.line + 1
            })
          end
        end
      end
    end
  end
end

return M
