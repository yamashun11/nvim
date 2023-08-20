vim.g ["fern#default_hidden"] = true
vim.g ["fern#renderer"] = "nerdfont"
vim.cmd([[
	augroup lua
		autocmd!
		autocmd FileType fern call glyph_palette#apply()
		autocmd FileType nerdtree, startify call glyph_palette#apply()
	augroup end
]])
