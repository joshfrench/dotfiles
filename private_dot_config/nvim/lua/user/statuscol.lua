local function diagnostic_click(args)
  if args.button == "l" then
    vim.diagnostic.open_float({ scope = 'line' }) -- Open diagnostic float on left click
  elseif args.button == "m" then
    vim.lsp.buf.code_action() -- Open code action on middle click
  end
end

local dap = require('dap')

local function dap_click(args)
  if args.button == "l" then
    if args.clicks == 2 then
      dap.step_into()
    else
      dap.step_over()
    end
  elseif args.button == 'r' then
    dap.step_out()
  end
end

require('statuscol').setup({
  setopt              = true,
  DapStopped          = dap_click,
  DiagnosticSignError = diagnostic_click,
  DiagnosticSignHint  = diagnostic_click,
  DiagnosticSignInfo  = diagnostic_click,
  DiagnosticSignWarn  = diagnostic_click,
})
