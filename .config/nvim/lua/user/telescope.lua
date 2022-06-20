local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- <CR> opens multiple selections in qf list and goes to first item,
-- or goes to single selection
local multiselect = function(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local selections = #picker:get_multi_selection()
  if not selections or selections <= 1 then
    actions.select_default(prompt_bufnr)
  else
    actions.send_selected_to_qflist(prompt_bufnr)
    actions.open_qflist()
    vim.cmd('cfirst')
  end
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close, -- close w/ <esc>
        ["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<cr>"] = multiselect,
      },
      n = {
        ["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<cr>"] = multiselect,
      },
    }
  }
})

telescope.load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', '<C-p>', builtin.git_files)
vim.keymap.set('n', '<leader>F', builtin.live_grep)
vim.keymap.set('n', '<leader>m', builtin.marks)
