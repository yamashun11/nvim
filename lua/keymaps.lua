vim.g.mapleader = " "

vim.api.nvim_set_keymap("i", "jj", "<esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "っｊ", "<esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "っｊ", "<C-\\><C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<C-w>w", { noremap = true, silent = true })

-- Fern
vim.api.nvim_set_keymap("n", "<Leader>e", ":Fern . -reveal=%<CR>", { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", ":Telescope help_tags hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fn", ":Telescope notify<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fo", ":Telescope oldfiles<CR>", { noremap = true, silent = true })

-- vim-wintabs
vim.api.nvim_set_keymap("n", "<C-T>h", ":WintabsPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-T>l", ":WintabsNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-T>c", ":WintabsClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-T>u", ":WintabsUndo<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-T>o", ":WintabsOnly<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-W>c", ":WintabsCloseWindow<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-W>o", ":WintabsOnlyWindow<CR>", { noremap = true, silent = true })

-- toggleterm and lazygit
vim.api.nvim_set_keymap("n", "<Leader>t", ":ToggleTerm<CR>", {noremap= true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

-- markdown preview
vim.api.nvim_set_keymap("n", "<Leader>mp", ":MarkdownPreview<CR>", {noremap= true, silent = true})

-- LSP
vim.keymap.set("n", "ge", vim.diagnostic.open_float)
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev)
vim.keymap.set("n", "g]", vim.diagnostic.goto_next)
vim.keymap.set("n", "gl", vim.diagnostic.setloclist)

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
