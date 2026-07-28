local colors = require('user.colors')

vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#4a5c62', italic = false })

require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = { delay = 250 },
  current_line_blame_formatter = '· <author>, <author_time:%R> - <summary>',
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '<leader>hb', function() gs.blame_line { full = true } end)
    map('n', '<leader>gb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
