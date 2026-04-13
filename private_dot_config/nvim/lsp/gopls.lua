return {
  cmd = { 'gopls', '-remote=auto' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  settings = {
    gopls = {
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = false,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true
      },
      ['formatting.local'] = 'github.com/posit-hosted/',
      buildFlags = { '-tags=e2e' },

      ['formatting.gofumpt'] = true,
      directoryFilters = {
        '-**/node_modules',
        '-**/.git',
        '-**/vendor',
      },

      semanticTokens = true,
      usePlaceholders = true,

      analyses = {
        unusedparams = true,
        shadow = false,
        nilness = true,
        unusedwrite = true,
      },

      staticcheck = false,
    }
  }
}
