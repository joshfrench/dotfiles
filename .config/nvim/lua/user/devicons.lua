local ok, icons = pcall(require, "nvim-web-devicons")
if not ok then
  return
end

icons.set_icon({
  gcfg = {
    icon = '',
    color = '#ececec',
    cterm_color = '231',
    name = 'GCFG',
  }
})
