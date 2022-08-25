local ok, yaml = pcall(require, 'yaml-companion')
if not ok then
  return
end

local cfg = yaml.setup({
  builtin_matchers = {
    kubernetes = { enabled = false },
  },
  schemas = {
    result = {
      {
        name = "Kubernetes 1.26.3",
        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.23.6-standalone-strict/all.json"
      },
    },
  },
  lspconfig = {
    filetypes = { "gotmpl", "yaml", "yaml.docker-compose" },
    settings = {
      yaml = {
        customTags = {
          "!Base64",
          "!Cidr",
          "!FindInMap sequence",
          "!GetAtt",
          "!GetAZs",
          "!ImportValue",
          "!Join sequence",
          "!Ref",
          "!Select sequence",
          "!Split sequence",
          "!Sub sequence",
          "!Sub",
          "!And sequence",
          "!Condition",
          "!Equals sequence",
          "!If sequence",
          "!Not sequence",
          "!Or sequence",
          "!secret"
        },
      }
    }
  }
})

return cfg
