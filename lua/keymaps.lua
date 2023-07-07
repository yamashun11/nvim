vim.g.mapleader = " "

vim.api.nvim_set_keymap('i', 'jj', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jj', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Leader>', '<C-w>w', { noremap = true, silent = true })

-- Fern
vim.api.nvim_set_keymap('n', '<Leader>e', ':Fern . -reveal=%<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>e', ':Fern . -reveal=% -drawer -toggle<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files hidden=true<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep hidden=true<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers hidden=true<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags hidden=true<CR>', { noremap = true, silent = true})

-- vim-wintabs
vim.api.nvim_set_keymap('n', '<C-h>', ':WintabsPrevious<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':WintabsNext<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-T>c', ':WintabsClose<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-T>u', ':WintabsUndo<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-T>o', ':WintabsOnly<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-W>c', ':WintabsCloseWindow<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-W>o', ':WintabsOnlyWindow<CR>', { noremap = true, silent = true})
