vim.keymap.set('n', '<C-e>', ':Neotree toggle<cr>', { silent = true })
vim.keymap.set('n', '<leader>e', ':Neotree toggle reveal<cr>', { silent = true })

require('neo-tree').setup({
  use_popups_for_input = false,
  open_files_do_not_replace_types = { "help", "trouble", "qf", "terminal" },
  close_if_last_window = true,
  source_selector = { winbar = true },
  default_component_configs = {
    indent = {
      with_markers = false, with_expanders = true,
      expander_collapsed = "", expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    name = { trailing_slash = true },
    modified = { symbol = '·', highlight = 'NeoTreeModifiedSymbol' },
    git_status = {
      symbols = {
        added = "", modified = "", deleted = "✖", renamed = "",
        untracked = "?", ignored = "◌", unstaged = "~", staged = "+", conflict = "=",
      }
    },
  },
  event_handlers = {
    { event = "file_opened", handler = function() require("neo-tree").close_all() end },
    { event = "file_renamed", handler = function(args) print(args.source, "renamed to", args.destination) end },
    { event = "file_moved", handler = function(args) print(args.source, "moved to", args.destination) end },
    { event = "file_deleted", handler = function(path) print(path, "deleted") end },
  },
  window = {
    position = 'right',
    mappings = {
      ['a'] = { 'add', config = { show_path = 'relative' } },
      ['<esc>'] = 'close_window',
    },
  },
  filesystem = {
    use_libuv_file_watcher = true,
    hijack_netrw_behavior = 'open_current',
    filtered_items = {
      always_show = { "dist", ".github", "posit", ".goreleaser.yaml", ".mockery.yaml" },
    },
    window = {
      mappings = {
        ['F'] = function(_) require('fzf-lua').live_grep() end,
        ['/'] = 'noop',
        [' '] = function(state)
          local node = state.tree:get_node()
          if node.type == 'directory' then
            require 'neo-tree.sources.filesystem'.toggle_directory(state, node)
          else
            require 'neo-tree.sources.filesystem.commands'.open(state)
          end
        end,
        ['h'] = function(state)
          local node = state.tree:get_node()
          if node.type == 'directory' and node:is_expanded() then
            require 'neo-tree.sources.filesystem'.toggle_directory(state, node)
          else
            require 'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
          end
        end,
        ["l"] = function(state)
          local node = state.tree:get_node()
          if node.type == 'directory' then
            if not node:is_expanded() then
              require 'neo-tree.sources.filesystem'.toggle_directory(state, node)
            elseif node:has_children() then
              require 'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
            end
          end
        end,
      }
    }
  },
})
