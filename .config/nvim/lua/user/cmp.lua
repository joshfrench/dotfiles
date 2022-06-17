local ok, cmp = pcall(require, 'cmp')
if not ok then
  return
end

-- cr/tab to exit when there are no matches
local cmp_confirm = function(fallback)
  if cmp.visible() and #cmp.get_entries() > 0 then
    cmp.confirm({ select = true })
  else
    fallback()
  end
end

local ok, snippy = pcall(require, 'snippy')
if not ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args) snippy.expand_snippet(args.body) end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4, {'i'}),
    ['<C-f>'] = cmp.mapping.scroll_docs(4, {'i'}),
    ['<CR>'] = cmp.mapping(cmp_confirm, {'i'}),
    ['<TAB>'] = cmp.mapping(cmp_confirm, {'i'}),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'emoji' }
  })
})
