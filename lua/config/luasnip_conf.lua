vim.keymap.set('n', '<leader>ls', require("luasnip.loaders").edit_snippet_files, { desc = "Edit snippets" })
require("luasnip.loaders.from_lua").load()
