local opts = {
	-- basics
  encoding = 'utf-8',
  backup = false,                                 -- no backups please
  swapfile = false,
  undofile = true,                                -- persistent undo is nice though
  undodir = vim.fn.stdpath('data')..'undo',
  undolevels = 1000,
  undoreload = 10000,
  ttimeoutlen = 0,                                -- no delay on exiting imode with <esc>
  shell = '/bin/bash -i',

  -- ui
  termguicolors = true,
  cursorline = true,
  signcolumn = "yes:1",

	-- mouse
  mouse = 'a',
  mousefocus = true,
  mousehide = true,
  mousemodel = 'popup',

  -- line numbers
  rnu = true,
  nu = true,

  -- status line
  laststatus = 3,                                 -- global statusline

  -- formatting
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,                               -- team spacebar for life
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
