local opts = {
	-- basics
  termguicolors = true,

	-- mouse
  mouse = 'a',
  mousefocus = true,
  mousehide = true,
  mousemodel = 'popup',

  -- formatting
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
