local cmp = require("cmp")
cmp.setup({
  snippet = {
    -- REQUIRED
    expand = function(args)
      --vim.fn["vsnip#anonymous"](args.body) -- For "vsnip" users.
      require("luasnip").lsp_expand(args.body) -- For "luasnip" users.
      --require("snippy").expand_snippet(args.body) -- For "snippy" users.
      --vim.fn["UltiSnips#Anon"](args.body) -- For "ultisnips" users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll the documentation window if visible
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll the documentation window if visible
    ["<C-p>"] = cmp.mapping.select_prev_item(), -- Select the previous item. Set count with large number to select pageup
    ["<C-n>"] = cmp.mapping.select_next_item(), -- Select the next item. Set count with large number to select pageup
    ["<C-y>"] = cmp.mapping.complete(), -- Invoke completion
    ["<C-e>"] = cmp.mapping.abort(), -- Closes the completion menu and restore the current line to the state before the current completion was started
    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accepts the currently selected completion item.
    -- If you didn't select any item and the option table contains `select = true`, nvim-cmp will automatically select the first item.
    ["<C-k>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    --{ name = "vsnip" }, -- For vsnip users.
    { name = "luasnip" }, -- For luasnip users.
    --{ name = "snippy" }, -- For snippy users.
    --{ name = "ultisnips" }, -- For ultisnips users.
  }, {
    { name = "buffer" },
  }),
})

--[[
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" }, -- you can specify the "git" source if [you were installed it](https://github.petertriho/cmp-git).
  }, {
    { name = "buffer" },
  })
})
]]

-- Use buffer source for "/" and "?"
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline % path source for ":"
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

--[[
local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                     -- can also be a function to dynamically calculate max width such as
                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default
    })
  }
}
]]
