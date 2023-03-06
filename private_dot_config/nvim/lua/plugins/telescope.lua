-- <CR> opens multiple selections in qf list and goes to first item,
-- or goes to single selection
local multiselect = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local selections = #picker:get_multi_selection()
  if not selections or selections <= 1 then
    require('telescope.actions').select_default(prompt_bufnr)
  else
    require('telescope.actions').send_selected_to_qflist(prompt_bufnr)
    require('telescope.actions').open_qflist()
    vim.cmd('cfirst')
  end
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    {
      dir = "~/src/joshfrench/yaml-companion.nvim/",
    }
  },
  opts = {
    defaults = {
      layout_strategy = "flex",
      mappings = {
        i = {
          ["<esc>"] = "close", -- close w/ <esc>
          ["<cr>"] = multiselect,
        },
        n = {
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
      lsp_references = {
        show_line = false, -- hide inline result (preview pane only)
        -- fname_width = 50,
        trim_text = false,
      }
    },
  },
  init = function()
    vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
    vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files)
    vim.keymap.set('n', '<C-b>', require('telescope.builtin').buffers)
    vim.keymap.set('n', '<leader>F', require('telescope.builtin').live_grep)
    vim.keymap.set('n', '<leader>m', require('telescope.builtin').marks)
    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyDone',
      callback = function()
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('yaml_schema')
      end
    })
  end
}
