return {
  'jay-babu/mason-nvim-dap.nvim',
  lazy = true,
  config = function()
    require('mason-nvim-dap').setup({
      ensure_installed = {
        'python',
        'delve',
      },
      automatic_installation = true,
      automatic_setup = true,
    })
  end
}
