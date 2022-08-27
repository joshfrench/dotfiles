local ok, yaml = pcall(require, 'yaml-companion')
if not ok then
  return
end

local all = require('yaml-companion.lsp.util').get_all_yaml_schemas()

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

local au = vim.api.nvim_create_augroup('detectSchema', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew' }, {
  pattern = { '*.yml', '*.yaml', '*.gotmpl' },
  group = au,
  callback = function(args)
    local bufnr = args.buf
    detectSchema(bufnr)
  end
})
