return {
  'williamboman/mason.nvim',
  opts = {
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    },
  },
  config = function()
    require('mason').setup()
    require('mason-nvim-dap').setup_handlers({})
  end
}
