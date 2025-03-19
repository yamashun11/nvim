local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
  snippet = {
    -- REQUIRED
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    --completion = cmp.config.window.bordered(),
    --documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(), -- Select the previous item. Set count with large number to select pageup
    ["<C-n>"] = cmp.mapping.select_next_item(), -- Select the next item. Set count with large number to select pageup
    ["<C-e>"] = cmp.mapping.abort(), -- Closes the completion menu and restore the current line to the state before the current completion was started
    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accepts the currently selected completion item.
                                                        -- If you didn't select any item and the option table contains `select = true`, nvim-cmp will automatically select the first item.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  }),
})

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

