-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float) -- TODO
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		--vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

require("mason").setup()
--require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	function(server_name) --default handler (optional)
		require("lspconfig")[server_name].setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "use" },
					},
				},
				texlab = {
					build = {
						args = { "-pdfdvi", "-interaction=nonostopmode", "-synctex=1", "%f" },
						executable = "latexmk",
						forwardSearchAfter = false,
						onSave = false
					},
					forwardSearch = {
						executable = "evince",
						args = { "%p" },
					},
					latexFormatter = "latexindent",
					latexindent = {
						modifyLineBreaks = false
					}
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
		null_ls.builtins.diagnostics.luacheck, -- lua linter
	},
})
