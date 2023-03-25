return {
  'jay-babu/mason-nvim-dap.nvim',
  lazy = true,
  opts = {
    ensure_installed = {
      'python',
      'delve',
    },
    automatic_installation = true,
    automatic_setup = true,
  }
}
