local ok, mason = pcall(require, 'mason')
if not ok then
  return
end

mason.setup({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  },
})

local ok, config = pcall(require, 'mason-lspconfig')
if not ok then
  return
end

config.setup({
  ensure_installed = {
    'bashls',
    'eslint',
    'gopls',
    'jsonls',
    'pyright',
    'rust_analyzer',
    'lua_ls',
    'tsserver',
    'yamlls'
  },
})

local opts = {
  capabilities = require 'user.lsp.handlers'.capabilities,
}

local handlers = {
  function(server_name) -- default handler
    require('lspconfig')[server_name].setup(opts)
  end,
}

for server in io.popen([[ls ./lua/user/lsp/settings]]):lines() do
  local name = server:match("(.+)%.lua")
  local ok, server_opts = pcall(require, "user.lsp.settings." .. name)
  if ok then
    handlers[name] = function()
      require('lspconfig')[name].setup(vim.tbl_deep_extend("keep", server_opts, opts))
    end
  end
end

config.setup_handlers(handlers)
