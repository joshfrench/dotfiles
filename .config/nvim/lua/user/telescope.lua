local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local multiselect = function(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if not num_selections or num_selections <= 1 then
    actions.add_selection(prompt_bufnr)
  end
  actions.send_selected_to_qf_list(prompt_bufnr)
  actions.open_qflist()
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
vim.keymap.set('n', '<leader>f', builtin.git_files) -- [f]ind files
vim.keymap.set('n', '<leader>r', builtin.live_grep) -- [r]ipgrep
vim.keymap.set('n', '<leader>m', builtin.marks) -- [m]arks
