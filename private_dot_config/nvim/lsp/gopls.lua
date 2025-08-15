return {
  cmd = { 'gopls' },
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
    }
  }
}
