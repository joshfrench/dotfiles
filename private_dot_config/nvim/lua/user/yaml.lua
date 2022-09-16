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
