local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED
		expand = function(args)
			--vim.fn["vsnip#anonymous"](args.body) -- For "vsnip" users.
			require("luasnip").lsp_expand(args.body) -- For "luasnip" users.
			--require("snippy").expand_snippet(args.body) -- For "snippy" users.
			--vim.fn["UltiSnips#Anon"](args.body) -- For "ultisnips" users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		--["<C-b>"] = cmp.mapping.scroll_docs(-4),
		--["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-p"] = cmp.mapping.select_prev_item(), -- move up
		["<C-n"] = cmp.mapping.select_next_item(), -- move down
		["<C-y>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-m>"] = cmp.mapping.confirm({ select = true }), -- comfirm completion
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		--{ name = "vsnip" }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		--{ name = "snippy" }, -- For snippy users.
		--{ name = "ultisnips" }, -- For ultisnips users.
	}, {
		{ name = "buffer" },
	})
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- you can specify the "git" source if [you were installed it](https://github.petertriho/cmp-git).
	}, {
		{ name = "buffer" },
	})
})

-- Use buffer source for "/" and "?"
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" }
	}
})

-- Use cmdline % path source for ":"
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" }
	}, {
		{ name = "cmdline" }
	})
})

local lspkind = require("lspkind")
cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
})
