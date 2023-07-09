-- to connect cmp_nvim_lsp to LSP
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	function(server_name) --default handler (optional)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
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

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black, -- python formatter
		null_ls.builtins.formatting.isort, -- python import sort
		null_ls.builtins.diagnostics.flake8, --python linter
		null_ls.builtins.formatting.stylua, -- lua formatter
		null_ls.builtins.diagnostics.luacheck.with({ -- lua linter
			extra_args = { "--globals", "vim", "--globals", "use" },
		}),
	},
})

-- Key mappings
vim.keymap.set("n", "ge", vim.diagnostic.open_float)
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev)
vim.keymap.set("n", "g]", vim.diagnostic.goto_next)
vim.keymap.set("n", "gq", vim.diagnostic.setloclist)

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gn", vim.lsp.buf.rename)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gf", function()
	vim.lsp.buf.format({ async = true })
end)
