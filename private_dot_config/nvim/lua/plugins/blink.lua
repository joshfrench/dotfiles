return {
  'saghen/blink.cmp',
  dependencies = {
    "moyiz/blink-emoji.nvim",
  },
  version = "1.*",
  opts = {
    sources = {
      default = {
        'lsp', 'buffer', 'path', 'emoji',
      },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          opts = {
            insert = true,
            trigger = function()
              return {':'}
            end,
          },
        },
      },
    },
    keymap = {
      preset = 'super-tab',
      ['<ESC>'] = { 'cancel', 'fallback' },
    },
    signature = { enabled = true },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = { enabled = true },
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 }
          }
        },
      },
    },
  },
  init = function ()
    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkCmpMenuOpen",
      callback = function()
        vim.b.copilot_suggestion_hidden = true
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkCmpMenuClose",
      callback = function()
        vim.b.copilot_suggestion_hidden = false
      end,
    })
  end
}
