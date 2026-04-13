require("copilot").setup({
  suggestion = {
    enabled = true, auto_trigger = true, debounce = 75,
    keymap = {
      accept_word = false, accept_line = false,
      next = false, prev = false, dismiss = false,
    },
  },
  panel = { enabled = false },
})

require("CopilotChat").setup({
  model = "claude-sonnet-4.5",
  mappings = {
    close = { normal = "<ESC>" },
    reset = { normal = "<C-c>", insert = "<C-c>" },
  }
})

vim.keymap.set('n', '<leader>a', require("CopilotChat").toggle, { silent = true })
