vim.cmd("autocmd TermOpen * startinsert")
vim.cmd("autocmd FileType * setlocal formatoptions-=ro") -- コメント改行時の自動コメントアウトを無効にする
