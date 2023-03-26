return {
  'jay-babu/mason-null-ls.nvim',
  lazy = true,
  opts = {
    ensure_installed = {
      'shellcheck',
      'prettierd',
      'autopep8',
    },
    automatic_installation = true,
    automatic_setup = false, -- sources configured via plugin.null-ls
  }
}
