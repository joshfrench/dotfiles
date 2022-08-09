local ok, lightbulb = pcall(require, "nvim-lightbulb")
if not ok then
  return
end

lightbulb.setup({
  ignore = { 'gitsigns', 'null-ls' },
  autocmd = {
    enabled = true,
  }
})

vim.fn.sign_define('LightBulbSign', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
