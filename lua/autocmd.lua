vim.cmd("autocmd TermOpen * startinsert")
vim.cmd("autocmd FileType * setlocal formatoptions-=ro")
vim.cmd("autocmd ColorScheme * highlight TreesitterContextBottom gui=underline guisp=Grey")
