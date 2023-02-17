local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.prettierd,
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.autopep8.with({ -- match team pycharm
      generator_opts = {
        command = 'autopep8',
        to_stdin = true,
        args = require('null-ls.helpers').range_formatting_args_factory({
          '--max-line-length',
          '200',
          '-',
        },
          '--line-range',
          nil,
          { use_rows = true }),
      },
    }),
  },
})



--[[ This is broken :(

local rename = {
  name = "rename",
  method = null_ls.methods.CODE_ACTION,
  filetypes = { ["NvimTree"] = false, },
  generator = {
    async = true,
    fn = function(params, done)
      local lspParams = {
        textDocument = { uri = vim.uri_from_bufnr(params.bufnr) },
        position = { line = params.row, character = params.col },
      }
      vim.lsp.buf_request(params.bufnr, "textDocument/prepareRename", lspParams, function(err, result)
        if err ~= nil then
          null_ls.disable('rename')
          return done()
        end
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

local au = vim.api.nvim_create_augroup('Null-LS', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = au,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.renameProvider and client.server_capabilities.renameProvider.prepareProvider then
      if not null_ls.is_registered('rename') then
        null_ls.register(rename)
      end
      null_ls.enable('rename')
    else
      null_ls.disable('rename')
    end
  end
}) ]]
