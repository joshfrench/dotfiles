return {
  'nvim-neo-tree/neo-tree.nvim',
  enabled = true,
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "kyazdani42/nvim-web-devicons",
  },
  opts = {
    use_popups_for_input = false,
    open_files_do_not_replace_types = { "help", "trouble", "qf", "terminal" },
    close_if_last_window = true,
    source_selector = {
      winbar = true,
    },
    default_component_configs = {
      indent = {
        with_markers = false,
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      name = {
        trailing_slash = true,
      },
      modified = {
        symbol = '•',
        highlight = 'NeoTreeModifiedSymbol',
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "",  -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "",  -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖", -- this can only be used in the git_status source
          renamed   = "", -- this can only be used in the git_status source
          -- Status type
          untracked = "?",
          ignored   = "◌",
          unstaged  = "~",
          staged    = "+",
          conflict  = "=",
        }
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          --auto close
          require("neo-tree").close_all()
        end
      },
      --[[ {
      event = "file_opened",
      handler = function(file_path)
        --clear search after opening a file
        require("neo-tree.sources.filesystem").reset_search()
      end
    }, --]]
      {
        event = "file_renamed",
        handler = function(args)
          -- fix references to file
          print(args.source, "renamed to", args.destination)
        end
      },
      {
        event = "file_moved",
        handler = function(args)
          -- fix references to file
          print(args.source, "moved to", args.destination)
        end
      },
      {
        event = "file_deleted",
        handler = function(path)
          print(path, "deleted")
        end
      }
    },
    window = {
      position = 'right',
      mappings = {
        ['a'] = {
          'add',
          config = {
            show_path = 'relative',
          }
        },
        ['<esc>'] = 'close_window',
      },
    },
    filesystem = {
      use_libuv_file_watcher = true,
      hijack_netrw_behavior = 'open_current',
      window = {
        mappings = {
          ['F'] = function(_)
            require('telescope.builtin').live_grep()
          end,
          ['/'] = 'noop', -- just use builtin search
          [' '] = function(state)
            local node = state.tree:get_node()
            if node.type == 'directory' then
              require 'neo-tree.sources.filesystem'.toggle_directory(state, node)
            else
              require 'neo-tree.sources.filesystem'.open(state)
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
  },
  init = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    vim.keymap.set('n', '<C-e>', ':Neotree toggle<cr>', { silent = true })
    vim.keymap.set('n', '<leader>e', ':Neotree toggle reveal<cr>', { silent = true })
  end
}
