return {
  'rcarriga/nvim-dap-ui',
  lazy = true,
  opts = {
    expand_lines = false,
    force_buffers = true,
    layouts = {
      {
        elements = { {
          id = "scopes",
          size = 1
        } },
        position = "bottom",
        size = 15,
      },
      {
        elements = { {
          id = "breakpoints",
          size = 0.25,
        }, {
          id = "watches",
          size = 0.25,
        }, {
          id = "stacks",
          size = 0.25,
        }, {
          id = "repl",
          size = 0.25,
        } },
        position = "right",
        size = 75,
      },
    },
    mappings = {
      expand = { "<space>", "<right>" },
      open = { "o", "<cr>" },
    }
  },
}
