local ok, view = pcall(require, 'nvim-tree.view')
if not ok then
  return
end

vim.api.nvim_create_autocmd("QuitPre", {
  callback = view.close
})

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function()
    -- if #vim.api.nvim_list_wins() == 1 and
    if vim.fn.winnr('$') == 1 and
        vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
      view.close()
    end
  end
})
