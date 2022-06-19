local ok, code_action = pcall(require, 'code_action_menu')
if not ok then
  return
end

vim.keymap.set({'n', 'v'}, '<leader>.', code_action.open_code_action_menu)
vim.g.code_action_menu_show_details = false
