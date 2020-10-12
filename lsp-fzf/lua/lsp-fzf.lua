local vim = vim
local api = vim.api
local buf,win
local util = require 'vim.lsp.util'
local M = {}

--@private
local function sort_by_key(fn)
  return function(a,b)
    local ka, kb = fn(a), fn(b)
    assert(#ka == #kb)
    for i = 1, #ka do
      if ka[i] ~= kb[i] then
        return ka[i] < kb[i]
      end
    end
    -- every value must have been equal here, which means it's not less than.
    return false
  end
end
--@private
local position_sort = sort_by_key(function(v)
  return {v.start.line, v.start.character}
end)

function M.locations_to_items(locations)
  local items = {[vim.type_idx]=vim.types.array}
  local grouped = setmetatable({}, {
    __index = function(t, k)
      local v = {}
      rawset(t, k, v)
      return v
    end;
  })
  for _, d in ipairs(locations) do
    -- locations may be Location or LocationLink
    local uri = d.uri or d.targetUri
    local range = d.range or d.targetSelectionRange
    table.insert(grouped[uri], {start = range.start})
  end


  local keys = vim.tbl_keys(grouped)
  table.sort(keys)
  for _, uri in ipairs(keys) do
    local rows = grouped[uri]
    table.sort(rows, position_sort)
    local bufnr = vim.uri_to_bufnr(uri)
    vim.fn.bufload(bufnr)
    local filename = vim.uri_to_fname(uri)
    for _, temp in ipairs(rows) do
      local pos = temp.start
      local row = pos.line
      local line = (api.nvim_buf_get_lines(bufnr, row, row + 1, false) or {""})[1]
      local col = util.character_offset(bufnr, row, pos.character)
      table.insert(items, filename..':'..row..':'..col..' '..line)
    end
  end
  return items
end

function M.modifyCallback()
  local callback = 'textDocument/references'
  vim.lsp.callbacks[callback] = function(_, _, result, _)
    if not result then
      return
    end
    -- uri = result.uri
    -- local bufnr = vim.uri_to_bufnr(uri)
    -- if not bufnr then
    --   vim.lsp.err_message("LSP.publishDiagnostics: Couldn't find buffer for ", uri)
    --   return
    -- end
   local locations = M.locations_to_items(result)
   local source={[vim.type_idx]=vim.types.dictionary, ['source']=locations}
   api.nvim_call_function('fzf#run', {[vim.type_idx]=vim.types.array, source})
  end
end

M.on_attach = function(_, _)
  M.modifyCallback()
end

return M
