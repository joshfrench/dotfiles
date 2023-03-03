return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
  },
  opts = {
    ensure_installed = {
      'bashls',
      'eslint',
      'gopls',
      'jsonls',
      'pyright',
      'rust_analyzer',
      'lua_ls',
      'tsserver',
      'yamlls',
    },
  },
  init = function()
    local opts = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    }

    local handlers = {
      function(server_name) -- default handler
        require('lspconfig')[server_name].setup(opts)
      end,
    }

    local settings = vim.fn.stdpath('config') .. '/lua/user/lsp/'
    for server in io.popen('ls ' .. settings):lines() do
      local name = server:match("(.+)%.lua")
      local ok, server_opts = pcall(require, "user.lsp." .. name)
      if ok then
        handlers[name] = function()
          require('lspconfig')[name].setup(vim.tbl_deep_extend("keep", server_opts, opts))
        end
      end
    end

    require('mason-lspconfig').setup_handlers(handlers)
  end
}
