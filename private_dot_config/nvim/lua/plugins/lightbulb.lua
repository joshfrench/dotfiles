return {
  'kosayoda/nvim-lightbulb',
  opts = {
    ignore = { 'gitsigns', 'null-ls' },
    autocmd = {
      enabled = true,
    }
  },
  init = function()
    vim.fn.sign_define('LightBulbSign', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
  end
}
