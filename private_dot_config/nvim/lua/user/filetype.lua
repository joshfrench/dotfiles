local gcfg = vim.api.nvim_create_augroup('gcfg_filetype', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.gcfg',
  group = gcfg,
  callback = function()
    vim.opt_local.commentstring = '; %s'
    vim.opt_local.syntax = 'cfg'
  end
})

local gotmpl = vim.api.nvim_create_augroup('gotmpl_filetype', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = { '*.yml', '*.yaml' },
  group = gotmpl,
  callback = function(args)
    local opts = { noremap = true, silent = true, buffer = args.buf }
    vim.keymap.set('n', '<leader>y', require('telescope').extensions.yaml_schema.yaml_schema, opts)

    if vim.fn.search('{{-\\= \\(\\.\\|if\\|end\\).* \\=}}', 'cnw') > 0 then
      vim.opt_local.filetype = 'gotmpl'
    end
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gotmpl',
  group = gotmpl,
  callback = function(args)
    vim.cmd [[TSBufEnable highlight]]
    local client = vim.lsp.get_active_clients({ buffer = args.buf, name = 'yamlls' })[1]
    if client then
      client.config.settings.yaml.validate = false
      client.workspace_did_change_configuration(client.config.settings)
    end
  end
})
