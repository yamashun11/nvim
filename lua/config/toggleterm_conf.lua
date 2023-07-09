require("toggleterm").setup({
	function(term)
		if term.directon == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.colums * 0.4
		end
	end,
	start_in_insert = true,
	--direction = "vertical" | "horizontal" | "tab" | "float",
	direction = "horizontal",
	--direction = "float",
	close_on_exit = true,
	auto_scroll = true,
	float_opts = {
		--border = "single" | "double"  | "shadow" | "curved" | ... other options supported by win open
		border = "single",
	},
	winbar = {
		enabled = false,
		name_formatter = function(term) -- term: Terminal
			return term.name
		end,
	},
})

-- For lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true,
})
function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
