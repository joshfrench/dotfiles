-- TODO: requires nvim-dap to be installed
local function dap_click(args)
  if args.button == "l" then
    if args.clicks == 2 then
      require('dap').step_into()
    else
      require('dap').step_over()
    end
  elseif args.button == 'r' then
    require('dap').step_out()
  end
end

require('statuscol').setup({
  clickhandlers = { DapStopped = dap_click }
})
