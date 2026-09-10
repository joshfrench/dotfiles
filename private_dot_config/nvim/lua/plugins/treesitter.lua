vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.treesitter.query.add_directive("inject-go-tmpl!", function(_, _, bufnr, _, metadata)
  local fname = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
  local _, _, ext, _ = string.find(fname, ".*%.(%a+)(%.%a+)")
  metadata["injection.language"] = ext
end, {})

local ensure = {
  'bash', 'diff', 'dockerfile', 'fennel', 'go', 'gomod', 'gotmpl', 'hcl', 'javascript', 'json',
  'lua', 'make', 'markdown', 'markdown_inline', 'query', 'regex', 'ruby',
  'terraform', 'toml', 'tsx', 'typescript', 'python', 'rust', 'vim', 'yaml'
}

vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    local installed = require('nvim-treesitter.config').get_installed()
    local installed_set = {}
    for _, lang in ipairs(installed) do installed_set[lang] = true end
    local missing = vim.tbl_filter(function(lang) return not installed_set[lang] end, ensure)
    if #missing > 0 then
      vim.cmd('TSInstall ' .. table.concat(missing, ' '))
    end
  end,
})
