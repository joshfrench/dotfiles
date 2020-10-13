local vim = vim
local util = require 'vim.lsp.util'
local M = {}


local function create_source(item)
  return table.concat({item.filename, item.lnum, item.col}, ':')
end

function M.modifyCallback()
  vim.lsp.callbacks['textDocument/references'] = function(_, _, result, _)
    if not result then
      return
    end
   local sources ={[vim.type_idx]=vim.types.array}
   for _, item in ipairs(util.locations_to_items(result)) do
     table.insert(sources, create_source(item))
   end
   local fzf_opts={[vim.type_idx]=vim.types.dictionary, ['source']=sources}
   vim.api.nvim_call_function('fzf#run', {[vim.type_idx]=vim.types.array, fzf_opts})
  end
end

M.on_attach = function(_, _)
  M.modifyCallback()
end

return M
