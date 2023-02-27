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

-- delmarks currently broken, see https://github.com/neovim/neovim/pull/16067
local delete_marks = function(bufnr)
  local picker = action_state.get_current_picker(bufnr)
  local marks = picker:get_multi_selection()
  if #marks == 0 then
    marks = { action_state.get_selected_entry() }
  end
  for _, mark in ipairs(marks) do
    local _, _, m = string.find(mark.display, "(%w) ")
    if string.match(m, '[a-z]') then
      vim.api.nvim_buf_del_mark(m)
    else
      vim.api.nvim_del_mark(m)
    end
  end
  picker:refresh(require('telescope.builtin').marks())
end

telescope.setup({
  defaults = {
    layout_strategy = "flex",
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
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ['<C-d>'] = "delete_buffer",
        }
      }
    },
    marks = {
      mappings = {
        i = {
          ['<C-d>'] = delete_marks,
        }
      }
    },
    lsp_references = {
      show_line = false, -- hide inline result (preview pane only)
      -- fname_width = 50,
      trim_text = false,
    }
  },
})

telescope.load_extension('fzf')
telescope.load_extension('yaml_schema')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', '<C-p>', builtin.git_files)
vim.keymap.set('n', '<C-b>', builtin.buffers)
vim.keymap.set('n', '<leader>F', builtin.live_grep)
vim.keymap.set('n', '<leader>m', builtin.marks)
