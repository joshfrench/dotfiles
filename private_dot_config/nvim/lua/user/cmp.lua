local ok, cmp = pcall(require, 'cmp')
if not ok then
  return
end

-- cr/tab to exit when there are no matches
local cmp_confirm = function(fallback)
  if cmp.visible() and cmp.get_selected_entry() then
    cmp.confirm()
  else
    fallback()
  end
end

local ok, snippy = pcall(require, 'snippy')
if not ok then
  return
end

local ok, cmp_buffer = pcall(require, 'cmp_buffer')
if not ok then
  return
end

--[[ local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
} ]]
cmp.setup({
  preselect = cmp.PreselectMode.None,
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args) snippy.expand_snippet(args.body) end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs( -4, { 'i' }),
    ['<C-f>'] = cmp.mapping.scroll_docs(4, { 'i' }),
    ['<CR>'] = cmp.mapping(cmp_confirm, { 'i' }),
    ['<TAB>'] = cmp.mapping(cmp_confirm, { 'i' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp',                max_item_count = 20,                group_index = 1 },
    { name = 'nvim_lsp_signature_help', preselect = cmp.PreselectMode.None, },
    { name = 'nvim_lua' },
    { name = 'buffer',                  keyword_length = 2,                 max_item_count = 5, group_index = 2 },
    { name = 'path', },
    { name = 'emoji',                   max_item_count = 20 }
  }),
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    }
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    --[[ format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[VIM]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
      return vim_item
    end, ]]
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  }
})
