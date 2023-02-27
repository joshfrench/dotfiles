local dap = require('dap')

require("nvim-dap-virtual-text").setup {
  commented = true,
}
local dapui = require('dapui')
dapui.setup {} -- use default
dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

local go = require('dap-go')
go.setup()
require('dap-python').setup("python", {})

vim.fn.sign_define('DapBreakpoint', { text = '⚫', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DapBreakpointRejected', { text = '✖', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DiagnosticSignOk' })

local keymap = {
  R = dap.run_to_cursor,
  --[[ E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
  C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
  U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
  b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" }, ]]
  c = dap.continue,
  --[[ d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
  e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
  g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
  h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
  S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" }, ]]
  i = dap.step_into,
  o = dap.step_over,
  --[[ p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
  q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" }, ]]
  s = dap.continue,
  --[[ t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" }, ]]
  u = dap.step_out,
}

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { silent = true })
vim.keymap.set('n', '<leader>dR', dap.run_to_cursor, { silent = true })
vim.keymap.set('n', '<leader>dc', dap.continue, { silent = true })
vim.keymap.set('n', '<leader>ds', dap.continue, { silent = true })
vim.keymap.set('n', '<leader>di', dap.step_into, { silent = true })
vim.keymap.set('n', '<leader>do', dap.step_over, { silent = true })
vim.keymap.set('n', '<leader>du', dap.step_out, { silent = true })
vim.keymap.set('n', '<leader>dx', dap.terminate, { silent = true })
vim.keymap.set('n', '<leader>dt', go.debug_test, { silent = true }) -- TODO: also for python
