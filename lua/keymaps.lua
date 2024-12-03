-- Leader
vim.g.mapleader = " "

-- File reload
vim.keymap.set("n", "<Leader>r", "<Cmd>e!<CR>", { silent = true })

-- Esc
vim.keymap.set("i", "jj", "<esc>", { silent = true })
vim.keymap.set("i", "っｊ", "<esc>", { silent = true })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { silent = true })
vim.keymap.set("t", "っｊ", "<C-\\><C-n>", { silent = true })

-- Window
vim.keymap.set("n", "<Leader><Leader>", "<C-w>w", { silent = true })

-- Fern
--vim.keymap.set("n", "<Leader>e", "<Cmd>Fern . -reveal=% -drawer -toggle<CR>", { silent = true })
vim.keymap.set("n", "<Leader>e", "<Cmd>Fern . -reveal=%<CR>", { silent = true })

-- Telescope
vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files hidden=true<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope live_grep hidden=true<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers hidden=true<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fh", "<Cmd>Telescope help_tags hidden=true<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fn", "<Cmd>Telescope notify<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fo", "<Cmd>Telescope oldfiles<CR>", { silent = true })

-- vim-wintabs
vim.keymap.set("n", "<Leader>th", "<Cmd>WintabsPrevious<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tl", "<Cmd>WintabsNext<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tc", "<Cmd>WintabsClose<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tu", "<Cmd>WintabsUndo<CR>", { silent = true })
vim.keymap.set("n", "<Leader>to", "<Cmd>WintabsOnly<CR>", { silent = true })
vim.keymap.set("n", "<C-w>c", "<Cmd>WintabsCloseWindow<CR>", { silent = true })
vim.keymap.set("n", "<C-w>o", "<Cmd<Cmd>WintabsOnlyWindow<CR>", { silent = true })

-- winresizer
--vim.keymap.set("n", "<C-w>e", "<Cmd>WinResizerStartResize<CR>", { silent = true })
vim.g.winresizer_start_key = "<C-w>e"

-- Toggleterm
-- See: config/toggleterm_conf.lua

-- Startify
vim.keymap.set("n", "<Leader>s", "<Cmd>Startify<CR>", { silent = true })

-- Lazygit
vim.keymap.set("n", "<Leader>lg", "<Cmd>lua _lazygit_toggle()<CR>", { silent = true })

-- Markdown Preview
vim.keymap.set("n", "<Leader>m", "<Cmd>MarkdownPreview<CR>", { silent = true })

-- Turn off highlighted search
vim.keymap.set("n", "<Leader>n", "<Cmd>noh<CR>", { silent = true })

-- hlslens
vim.keymap.set(
  "n",
  "n",
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { silent = true }
)
vim.keymap.set(
  "n",
  "N",
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { silent = true }
)
vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { silent = true })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true })
vim.keymap.set("n", "gn", vim.lsp.buf.rename, { silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { silent = true })
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { silent = true })
vim.keymap.set("n", "gf", function()
  vim.lsp.buf.format({ async = true })
end, { silent = true })
-- Diagnostics
vim.keymap.set("n", "ge", vim.diagnostic.open_float, { silent = true })
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { silent = true })
vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("n", "gl", vim.diagnostic.setloclist, { silent = true })

-- Completion
-- See: config/nvim-cmp_conf.lua

-- gitsigns
-- See: config/gitsigns_conf.lua
