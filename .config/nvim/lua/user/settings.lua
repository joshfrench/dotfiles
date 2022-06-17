local opts = {
  -- basics
  encoding = 'utf-8',
  backup = false,                                 -- no backups please
  swapfile = false,
  undofile = true,                                -- persistent undo is nice though
  undodir = vim.fn.stdpath('data')..'undo',
  undolevels = 1000,
  undoreload = 10000,
  updatetime = 250,
  ttimeoutlen = 0,                                -- no delay on exiting imode with <esc>
  shell = '/bin/bash -i',

  -- buffers
  switchbuf = 'useopen,usetab,uselast',
  hidden = true,
  splitright = true,
  splitbelow = true,
  tabpagemax = 15,

  -- commandline
  history=1000,
  wildmenu = true,
  wildmode = 'list:longest,full',
  wildignore = '*/tmp/*,*/sourcemaps/*,*/node_modules/*',

  -- ui
  termguicolors = true,
  background = 'dark',
  cursorline = true,
  signcolumn = "yes:1",
  shortmess = vim.o.shortmess..'mrc',
  viewoptions = 'folds,cursor,curdir,options',
  completeopt = 'menuone,noselect',

  -- text editing
  virtualedit = "onemore",
  whichwrap = 'b,s,h,l,<,>,[,]',
  backspace = 'indent,eol,start',
  scrolljump = 3,
  scrolloff = 3,
  list = true,
  listchars = { tab = '› ', trail = '•', extends = '#', nbsp = '+'},
  foldlevelstart = 99,
  linebreak = true,

  -- search
  showmatch = true,
  incsearch = true,
  hlsearch = true,
  ignorecase = true,
  smartcase = true,

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
  showmode = false,                               -- mode is in statusline

  -- formatting
  wrap = true,
  autoindent = true,
  shiftwidth = 2,
  shiftround = true,
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,                               -- team spacebar for life

  -- copy/paste
  clipboard = 'unnamedplus',
  pastetoggle = '<leader>p',
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
