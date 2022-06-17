local ok, surround = pcall(require, 'mini.surround')
if not ok then
  return
end

surround.setup()
