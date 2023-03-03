return {
  filetypes = { "yaml", "yaml.docker-compose" },
  settings = {
    flags = {
      debounce_text_changes = 150,
    },
    single_file_support = true,
    redhat = { telemetry = { enabled = false } },
    yaml = {
      validate = false,
      format = { enable = true, proseWrap = "Never" },
      hover = true,
      completion = true,
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemaDownload = { enable = true },
      schemas = { result = {} },
      trace = { server = "debug" },
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
    },
  }
}
