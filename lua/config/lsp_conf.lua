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
	texlab = function()
		require("lspconfig").texlab.setup({
			texlab = {
				auxDirectory = ".",
				bibtexFormatter = "latexindent",
				--build = {},
				chktex = {
					onEdit = true,
					onOpenAndSave = true,
				},
				diagnosticsDelay = 300,
				formatterLineLength = 80,
				forwardSearch = {
				},
				latexFormatter = "latexindent",
				latexindent = {
					modifyLineBreaks = false
				},
			}
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

-- virtual text
vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
