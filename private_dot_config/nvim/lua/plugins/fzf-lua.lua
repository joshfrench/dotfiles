local function multiselect_action(selected, opts)
  if #selected > 1 then
    local qf_list = {}
    for _, entry in ipairs(selected) do
      local filename = entry:match("^([^:]+)")
      local lnum = entry:match(":(%d+):")
      local text = entry:match(":%d+:(.*)") or entry
      table.insert(qf_list, {
        filename = filename,
        lnum = lnum and tonumber(lnum) or 1,
        text = text
      })
    end
    vim.fn.setqflist(qf_list)
    vim.cmd('copen')
    vim.cmd('cfirst')
  else
    require('fzf-lua.actions').file_edit(selected, opts)
  end
end

return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  opts = {
    fzf_colors = {
      ["fg"]          = { "fg", "CursorLine" },
      ["bg"]          = { "bg", "Normal" },
      ["hl"]          = { "fg", "Comment" },
      ["fg+"]         = { "fg", "Normal", "underline" },
      ["bg+"]         = { "bg", { "CursorLine", "Normal" } },
      ["hl+"]         = { "fg", "Statement" },
      ["info"]        = { "fg", "PreProc" },
      ["prompt"]      = { "fg", "Conditional" },
      ["pointer"]     = { "fg", "Exception" },
      ["marker"]      = { "fg", "Keyword" },
      ["spinner"]     = { "fg", "Label" },
      ["header"]      = { "fg", "Comment" },
      ["gutter"]      = "-1",
    },
  },
  init = function()
    vim.keymap.set('n', '<C-p>', require('fzf-lua').global)
    vim.keymap.set('n', 'grr', require('fzf-lua').lsp_references)
    vim.keymap.set('n', '<leader>F', require('fzf-lua').live_grep)
    vim.keymap.set('n', '<leader>m', require('fzf-lua').marks)
    vim.keymap.set('n', '<leader>b', require('fzf-lua').buffers)
  end
}
