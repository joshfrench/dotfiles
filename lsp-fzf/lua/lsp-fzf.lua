local vim = vim
local util = require 'vim.lsp.util'
local M = {}


local function create_source(item)
  local fname = item.filename
  local prefix = vim.api.nvim_call_function('getcwd', {})
  if prefix then
    fname = string.gsub(fname, prefix..'/', '')
  end
  return table.concat({fname, item.lnum, item.col}, ':')
end

function M.modifyCallback()
  vim.lsp.callbacks['textDocument/references'] = function(_, _, result, _)
    if not result then
      return
    end
   local sources = {[vim.type_idx]=vim.types.array}
   for _, item in ipairs(util.locations_to_items(result)) do
     table.insert(sources, create_source(item))
   end
   local fzf_opts = {[vim.type_idx]=vim.types.dictionary, ['source']=sources, ['options']={'--layout=reverse-list', '--margin=1', '--color=bg:0,gutter:0'}}
   local wrapped = vim.api.nvim_call_function('fzf#vim#with_preview', {[vim.type_idx]=vim.types.array, fzf_opts})
   vim.api.nvim_call_function('fzf#vim#grep', {[vim.type_idx]=vim.types.array, "rg --smart-case --color=always --colors 'path:fg:4' --colors 'line:fg:2' ", 1, wrapped})
  end
end

M.on_attach = function(_, _)
  M.modifyCallback()
end

return M
