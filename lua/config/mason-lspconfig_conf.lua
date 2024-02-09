require("mason").setup()
require("mason-lspconfig").setup_handlers({
  function(server_name) --default handler (optional)
    require("lspconfig")[server_name].setup({
      -- to connect cmp_nvim_lsp to LSP
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
  end,
  lua_ls = function()
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "use" },
          },
        },
      },
    })
  end,
})

-- virtual text
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
