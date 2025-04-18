-- See: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
null_ls.setup({
  diagnostic_config = {
    virtual_text = false,
  },
  sources = {
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
    -- Lua
    null_ls.builtins.formatting.stylua,
    --null_ls.builtins.diagnostics.luacheck.with({
    --  extra_args = { "--globals", "vim", "--globals", "use" },
    --}),
    -- Fortran
    null_ls.builtins.formatting.fprettify.with({
      extra_args = { '--indent', '2', '--enable-replacements', '--c-relations', '--whitespace', '2', '--case', '1', '1', '1', '1', '--strict-indent', '--line-length', '1024'},
    }),
    -- LaTeX
    null_ls.builtins.formatting.latexindent,
  },
})
