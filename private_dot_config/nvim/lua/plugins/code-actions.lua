return {
  'weilbith/nvim-code-action-menu',
  init = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>.', require('code_action_menu').open_code_action_menu)
    vim.g.code_action_menu_show_details = false
  end
}
