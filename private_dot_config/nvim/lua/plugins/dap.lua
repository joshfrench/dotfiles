return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    {
      'theHamsta/nvim-dap-virtual-text',
      opts = { commented = true },
    },
  },
  lazy = true,
  keys = {
    '<leader>db',
    '<leader>dc',
    '<leader>ds',
  },
  init = function()
    vim.fn.sign_define('DapBreakpoint', { text = '⚫', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '✖', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DiagnosticSignOk' })

    local colors = require('user.colors')
    for hl, color in pairs({
      DapUIScope = colors.cyan,
      DapUIType = colors.violet,
      DapUIModifiedValue = colors.cyan,
      DapUIDecoration = colors.cyan,
      DapUIThread = colors.green,
      DapUIStoppedThread = colors.cyan,
      DapUISource = colors.violet,
      DapUILineNumber = colors.cyan,
      DapUIFloatBorder = colors.cyan,
      DapUIWatchesEmpty = colors.red,
      DapUIWatchesValue = colors.green,
      DapUIWatchesError = colors.red,
      DapUIBreakpointsPath = colors.cyan,
      DapUIBreakpointsInfo = colors.green,
      DapUIBreakpointsCurrentLine = colors.green,
      DapUIBreakpointsDisabledLine = colors.base1,
      DapUIStepOver = colors.cyan,
      DapUIStepInto = colors.cyan,
      DapUIStepBack = colors.cyan,
      DapUIStepOut = colors.cyan,
      DapUIStop = colors.red,
      DapUIPlayPause = colors.green,
      DapUIRestart = colors.green,
      DapUIUnavailable = colors.base1,
      DapUIWinSelect = colors.cyan,
    }) do
      vim.api.nvim_set_hl(0, hl, { fg = color })
    end
  end,
  config = function()
    require('dap').listeners.after.event_initialized["dapui_config"] = require('dapui').open
    require('dap').listeners.before.event_terminated["dapui_config"] = require('dapui').close
    require('dap').listeners.before.event_exited["dapui_config"] = require('dapui').close

    vim.keymap.set('n', '<leader>dc', require('dap').continue, { silent = true })
    vim.keymap.set('n', '<leader>ds', require('dap').continue, { silent = true }) -- s for start
    vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { silent = true })
    vim.keymap.set('n', '<leader>dR', require('dap').run_to_cursor, { silent = true })
    vim.keymap.set('n', '<leader>di', require('dap').step_into, { silent = true })
    vim.keymap.set('n', '<leader>do', require('dap').step_over, { silent = true })
    vim.keymap.set('n', '<leader>du', require('dap').step_out, { silent = true })
    vim.keymap.set('n', '<leader>dx', require('dap').terminate, { silent = true })
  end,
}

--[[ Additional keymaps
E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
c = dap.continue,
d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
i = dap.step_into,
o = dap.step_over,
p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
s = dap.continue,
t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
]]
