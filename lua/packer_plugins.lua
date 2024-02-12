-- This file can be loaded by calling 'require("plugins")' from your init.lua

-- Only required if you have packer configured as `opt`
vim.cmd("packadd packer.nvim")

require("packer").startup({
  function()
    -- Itself
    use({ "wbthomason/packer.nvim", opt = true })

    -- Colorscheme
    use({
      "marko-cerovac/material.nvim",
      config = function()
        require("config.material_conf")
      end,
    })

    -- Dashboard
    use("mhinz/vim-startify")

    -- File Explorer
    use({
      "lambdalisue/fern.vim",
      config = function()
        require("config.fern_conf")
      end,
      requires = {
        "lambdalisue/nerdfont.vim",
        "lambdalisue/fern-renderer-nerdfont.vim",
        "lambdalisue/glyph-palette.vim",
      },
    })
    use("lambdalisue/fern-git-status.vim")

    -- Fuzzy Finder
    use({
      "nvim-telescope/telescope.nvim",
      tag = "0.1.5",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    })

    -- Scroll bar
    use({
      "petertriho/nvim-scrollbar",
      config = function()
        require("config.scrollbar_conf")
      end,
      requires = {
        "kevinhwang91/nvim-hlslens",
        "lewis6991/gitsigns.nvim",
      },
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

    -- Cmd and notice preference
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

    -- Highlighted yank
    use("machakann/vim-highlightedyank")

    -- Highlighted search
    use("kevinhwang91/nvim-hlslens")

    -- Highlighted indent
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("config.indent-blankline_conf")
      end,
    })

    -- LSP
    use({
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("config.mason-lspconfig_conf")
      end,
      requires = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
      },
    })
    -- Use a Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    use({
      "nvimtools/none-ls.nvim",
      config = function()
        require("config.none-ls_conf")
      end,
      requires = "nvim-lua/plenary.nvim",
    })

    -- Completion and Snippets
    use({
      "hrsh7th/nvim-cmp",
      config = function()
        require("config.nvim-cmp_conf")
      end,
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        {
          "L3MON4D3/LuaSnip",
          config = function()
            require("config.luasnip_conf")
          end,
        },
      },
    })

    ---- Latex
    use({
      "lervag/vimtex",
      config = function()
        require("config.vimtex_conf")
      end,
    })

    -- Markdown
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function ()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
      config = function()
        require("config.markdown-preview_conf")
      end,
    })

    -- Git
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("config.gitsigns_conf")
      end,
    })

    -- Restore IME status for fcitx
    use("h-hg/fcitx.nvim")
  end,

  -- Packer config
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
