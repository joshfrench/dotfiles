return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  settings = {
    gopls = {
      gofumpt = true,
      ['local'] = 'github.com/posit-hosted/',
      buildFlags = { '-tags=e2e' },

      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = false,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true
      },

      directoryFilters = {
        '-**/node_modules',
        '-**/.git',
        '-**/vendor',
      },

      semanticTokens = true,
      usePlaceholders = true,

      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },

      analyses = {
        unusedparams = true,
        shadow = false,
        nilness = true,
        unusedwrite = true,
        useany = true,
      },

      staticcheck = true,
    }
  }
}
