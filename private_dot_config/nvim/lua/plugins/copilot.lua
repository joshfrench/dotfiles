return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        config = function()
          require("copilot").setup({
            suggestion = {
              enabled = true,
              auto_trigger = true,
              debounce = 75,
              keymap = {
                accept = "<Tab>",
                accept_word = false,
                accept_line = false,
                next = false,
                prev = false,
                dismiss = false,
              },
            },
            panel = { enabled = false },
          })
        end,
      },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    event = "InsertEnter",
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "claude-3.7-sonnet",
      mappings = {
        close = {
          normal = "<ESC>",
        },
        reset = {
          normal = "<C-c>",
          insert = "<C-c>",
        }
      }
    },
    init = function()
      vim.keymap.set('n', '<leader>a', require("CopilotChat").toggle, { silent = true })
    end
  },
}
