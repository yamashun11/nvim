vim.cmd("packadd packer.nvim")

require("packer").startup(function()
	-- Itself
	use("wbthomason/packer.nvim")

	-- Dashboard
	use("mhinz/vim-startify")

	-- Colorscheme
	use({
		"marko-cerovac/material.nvim",
		config = function()
			require("config.material_conf")
		end,
	})

	-- File explorer
	use({
		"lambdalisue/fern.vim",
		config = function()
			require("config.fern_conf")
		end,
	})
	use("lambdalisue/nerdfont.vim")
	use("lambdalisue/fern-renderer-nerdfont.vim")
	use("lambdalisue/glyph-palette.vim")

	-- Finder
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("config.telescope_conf")
		end,
	})
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-web-devicons")

	-- Scroll bar
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("config.scrollbar_conf")
		end,
	})
	use({
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("config.hlslens_conf")
		end,
	})

	-- Status bar
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine_conf")
		end,
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})

	-- Tab bar
	use("zefei/vim-wintabs")
	use("zefei/vim-wintabs-powerline")

	-- Window resizer
	use("simeji/winresizer")

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("config.toggleterm_conf")
		end,
	})

	-- cmd and notice position
	use({
		"folke/noice.nvim",
		config = function()
			require("config.noice_conf")
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})
	use("MunifTanjim/nui.nvim")
	use("rcarriga/nvim-notify")

	-- highlightedyank
	use("machakann/vim-highlightedyank")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason-lspconfig.nvim")
	use({
		"williamboman/mason.nvim",
		config = function()
			require("config.lsp_conf")
		end,
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
	})
	-- Use a Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("config.nvim-cmp_conf")
		end,
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	--use "hrsh7th/vim-vsnip"
	--use "hrsh7th/cmp-vsnip"
	use("L3MON4D3/LuaSnip")
	use("onsails/lspkind.nvim")

	-- Latex

	-- Markdown
	use("iamcco/markdown-preview.nvim")
end)
