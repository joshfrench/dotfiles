-- cr/tab to exit when there are no matches
local cmp_confirm = function(fallback)
  if require('cmp').visible() and require('cmp').get_selected_entry() then
    require('cmp').confirm()
  else
    fallback()
  end
end

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',
    'onsails/lspkind.nvim',
    -- 'PaterJason/cmp-conjure'
  },
  event = 'InsertEnter',
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      preselect = cmp.PreselectMode.None,
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      snippet = {
        expand = function(args) require('snippy').expand_snippet(args.body) end
      },
      mapping = require('cmp').mapping.preset.insert({
        ['<C-d>'] = require('cmp').mapping.scroll_docs(-4, { 'i' }),
        ['<C-f>'] = require('cmp').mapping.scroll_docs(4, { 'i' }),
        ['<CR>'] = require('cmp').mapping(cmp_confirm, { 'i' }),
        ['<TAB>'] = require('cmp').mapping(cmp_confirm, { 'i' }),
      }),
      sources = cmp.config.sources({
        {
          name = 'nvim_lsp',
          priority = 10,
          max_item_count = 20,
          group_index = 1
        },
        { name = 'nvim_lsp_signature_help', preselect = cmp.PreselectMode.None, },
        { name = 'nvim_lua' },
        {
          name = 'buffer',
          priority = 2,
          max_item_count = 20,
          group_index = 2,
          keyword_length = 2
        },
        { name = 'path', },
        {
          name = 'emoji',
          priority = 1,
          max_item_count = 20
        },
        -- { name = 'conjure' },
      }),
      sorting = {
        comparators = {
          cmp.config.compare.locality,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.offset,
          cmp.config.compare.order,
          -- cmp.config.compare.exact,
          -- cmp.config.compare.kind,
          -- cmp.config.compare.sort_text,
          -- cmp.config.compare.length,
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
  end
}
