require('fzf-lua').setup({
  fzf_colors = {
    ["fg"]      = { "fg", "CursorLine" },
    ["bg"]      = { "bg", "Normal" },
    ["hl"]      = { "fg", "Comment" },
    ["fg+"]     = { "fg", "Normal", "underline" },
    ["bg+"]     = { "bg", { "CursorLine", "Normal" } },
    ["hl+"]     = { "fg", "Statement" },
    ["info"]    = { "fg", "PreProc" },
    ["prompt"]  = { "fg", "Conditional" },
    ["pointer"] = { "fg", "Exception" },
    ["marker"]  = { "fg", "Keyword" },
    ["spinner"] = { "fg", "Label" },
    ["header"]  = { "fg", "Comment" },
    ["gutter"]  = "-1",
  },
})

vim.keymap.set('n', '<C-p>', require('fzf-lua').global)
vim.keymap.set('n', 'gr', require('fzf-lua').lsp_references)
vim.keymap.set('n', 'gi', require('fzf-lua').lsp_implementations)
vim.keymap.set('n', 'gt', require('fzf-lua').lsp_typedefs)
vim.keymap.set('n', '<leader>F', require('fzf-lua').live_grep)
vim.keymap.set('n', '<leader>m', require('fzf-lua').marks)
vim.keymap.set('n', '<leader>b', require('fzf-lua').buffers)
