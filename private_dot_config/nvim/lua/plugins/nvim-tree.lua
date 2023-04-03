-- TODO: strip defaults out of here
local opts = {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 30,
    -- height = 30,
    hide_root_folder = false,
    side = "right",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
        { key = "<space>",   action = "edit" },
        { key = "<C-e>",     action = "close" },
        { key = '<esc>',     action = "close" },
        { key = '<leader>e', action = 'close' },
        { key = 'u',         action = "parent_node" },
        { key = 'U',         action = "dir_up" },
        { key = '<BS>',      action = "dir_up" },
        { key = 'C',         action = "cd" },
        { key = '.',         action = "cd" },
        { key = 'F',         action = ":Telescope live_grep<CR>" }
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "•",
          staged = "+",
          unmerged = "=",
          renamed = ">",
          untracked = "?",
          deleted = "-",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = false,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = true,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}

return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  enabled = false,
  opts = opts,
  init = function()
    local keys = vim.keymap
    keys.set('n', '<C-e>', require('nvim-tree.api').tree.toggle)
    keys.set('n', '<leader>e', function() require('nvim-tree.api').tree.toggle(true, false) end)

    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function(data)
        local dir = vim.fn.isdirectory(data.file) == 1
        if not dir then
          return
        end

        vim.cmd.cd(data.file)

        require('nvim-tree.api').tree.open()
      end
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'NvimTreeSetup',
      callback = function()
        local colors = require('user.colors')
        vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = colors.green })
        vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = colors.cyan })
        vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = colors.blue })
      end
    })

    vim.api.nvim_create_autocmd("QuitPre", {
      callback = require('nvim-tree.view').close
    })

    vim.api.nvim_create_autocmd("WinClosed", {
      callback = function()
        -- if #vim.api.nvim_list_wins() == 1 and
        if vim.fn.winnr('$') == 1 and
            vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
          require('nvim-tree.view').close()
        end
      end
    })
  end
}
