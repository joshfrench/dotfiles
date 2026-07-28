require('blink.cmp').setup({
  sources = {
    default = { 'lsp', 'buffer', 'path', 'emoji', 'snippets' },
    providers = {
      emoji = {
        module = "blink-emoji", name = "Emoji",
        opts = {
          insert = true,
          trigger = function() return { ':' } end,
        },
      },
      snippets = {
        opts = {
          search_paths = { vim.fn.stdpath('config') .. '/snippets' },
        },
        transform_items = function(_, items)
          for _, item in ipairs(items) do
            item.labelDetails = { description = item.description }
          end
          return items
        end,
      },
    },
  },
  keymap = {
    preset = 'enter',
    ['<TAB>'] = {
      function(cmp)
        if cmp.is_visible() and cmp.get_selected_item() then
          return cmp.accept()
        elseif require('copilot.suggestion').is_visible() then
          require('copilot.suggestion').accept()
          return true
        end
      end,
      'fallback'
    },
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = false },
    list = { selection = { preselect = false } },
    menu = {
      auto_show = true,
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind", gap = 1 }
        }
      },
    },
  },
  signature = { enabled = true },
})
