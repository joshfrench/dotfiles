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
    -- require('mason-nvim-dap').setup()
    require('mason-null-ls').setup()
  end
}
