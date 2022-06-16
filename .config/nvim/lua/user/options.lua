local opts = {
  termguicolors = true,

  mouse = a,
  mousefocus = true,
  mousehide = true,
  mousemodel = popup
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
