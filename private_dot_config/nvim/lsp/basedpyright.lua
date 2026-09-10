return {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  settings = {
    basedpyright = {
      -- Ruff owns lint and import sorting.
      disableOrganizeImports = true,
      analysis = {
        -- The 'all' default reports thousands of warnings on real projects.
        typeCheckingMode = 'standard',
        diagnosticMode = 'openFilesOnly',
        autoImportCompletions = true,
        inlayHints = {
          variableTypes = true,
          callArgumentNames = true,
          functionReturnTypes = true,
          genericTypes = false,
        },
      },
    },
  },
}
