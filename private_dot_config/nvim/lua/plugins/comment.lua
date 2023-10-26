--[[ This function will be called automatically by the mapping, the first
argument will be the line that is being operated on. ]]
local function insert_comment_below(...)
  local args = { ... }
  -- This includes the commentstring
  local configuration = require('kommentary.config').get_config(0)
  local line_number = args[1]
  -- Get the current content of the line
  local content = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
  --[[ Get the level of indentation of that line (Find the index of the first non-whitespace character) ]]
  local indentation = string.find(content, "%S")
  --[[ Create a string with that indentation, with a dot at the end so that kommentary respects that indentation ]]
  local new_line = string.rep(" ", indentation - 1) .. "."
  -- Insert the new line underneath the current one
  vim.api.nvim_buf_set_lines(0, line_number, line_number, false, { new_line })
  -- Comment in the new line
  require('kommentary.kommentary').comment_in_line(line_number + 1, configuration)
  -- Set the cursor to the correct position
  vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1] + 1, #new_line + 2 })
  -- Change the char under cursor (.)
  vim.api.nvim_feedkeys("cl", "n", false)
end

local function insert_comment_above(...)
  local args = { ... }
  local configuration = require('kommentary.config').get_config(0)
  local line_number = args[1]
  local content = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
  local indentation = string.find(content, "%S")
  local new_line = string.rep(" ", indentation - 1) .. "."
  vim.api.nvim_buf_set_lines(0, line_number - 1, line_number - 1, false, { new_line })
  require('kommentary.kommentary').comment_in_line(line_number, configuration)
  vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1] - 1, #new_line + 2 })
  vim.api.nvim_feedkeys("cl", "n", false)
end

local function insert_comment_end()
  local commentstr = require('kommentary.config').get_config(0)[1]
  vim.api.nvim_feedkeys("A " .. commentstr .. " ", "n", false)
end

return {
  'b3nj5m1n/kommentary',
  config = function()
    vim.g.kommentary_create_default_mappings = false

    local keys = vim.keymap
    keys.set('n', '<C-_><C-_>', '<Plug>kommentary_line_default', {})
    keys.set('n', '<C-_>', '<Plug>kommentary_motion_default', {})
    keys.set('x', '<C-_>', '<Plug>kommentary_visual_default', {})

    -- Set up a regular keymapping to the new <Plug> mapping
    vim.api.nvim_set_keymap('n', '<C-_>o', '<Plug>kommentary_insert_below', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-_>O', '<Plug>kommentary_insert_above', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-_>A', '<Plug>kommentary_insert_end', { silent = true })

    local comment = require('kommentary.config')
    --[[ This is a method provided by kommentary's config, it will take care of
    setting up a <Plug> mapping. The last argument is the optional callback
    function, meaning when we execute this mapping, this function will be
    called instead of the default. --]]
    comment.add_keymap("n", "kommentary_insert_below", comment.context.line, { expr = true }, insert_comment_below)
    comment.add_keymap("n", "kommentary_insert_above", comment.context.line, { expr = true }, insert_comment_above)
    comment.add_keymap("n", "kommentary_insert_end", comment.context.line, { expr = true }, insert_comment_end)
  end
}
