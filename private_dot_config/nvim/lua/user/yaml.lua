local ok, yaml = pcall(require, 'yaml-companion')
if not ok then
  return
end

yaml.setup({
  builtin_matchers = {
    kubernetes = { enabled = true },
  },
  schemas = {
    result = {
      --[[ {
        name = "Kubernetes 1.26.3",
        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.23.6-standalone-strict/all.json"
      }, ]]
    },
  },
})

local au = vim.api.nvim_create_augroup('yamlls', { clear = true })
local yaml_types = { '*.yaml', '*.yml', '*.gotmpl' }

vim.api.nvim_create_autocmd('LspAttach', {
  group = au,
  pattern = yaml_types,
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>y', require('telescope').extensions.yaml_schema.yaml_schema, opts)
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = au,
  pattern = yaml_types,
  callback = function(args)
    local client = vim.lsp.get_active_clients({ buffer = args.buf, name = 'yamlls' })[1]
    if client then
      vim.lsp.buf_detach_client(args.buf, client.id)
      print "Detaching yamlls, do not lint gotmpls"
    end
  end
})


-- TODO: this becomes a matcher/eliminate autocmd
--[[
local schemas = {
  ['^AWSTemplateFormatVersion: '] = {
    name = 'AWS CloudFormation',
    uri = 'https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json',
  }
}

local detectSchema = function(bufnr)
  local schema
  for match, result in pairs(schemas) do
    if vim.fn.search(match, 'nw') > 0 then
      schema = result
    end
  end
  if schema then
    yaml.set_buf_schema(bufnr, { result = { schema } })
  end
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew' }, {
  pattern = { '*.yml', '*.yaml', '*.gotmpl' },
  group = au,
  callback = function(args)
    local bufnr = args.buf
    detectSchema(bufnr)
  end
}) ]]
