require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --override = {
      --["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      --["vim.lsp.util.stylize_markdown"] = true,
      --["cmp.entry.get_documentation"] = true,
    --},
    hover = {
      enabled = false,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long mesage will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  messages = {
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
    view_search = "mini",
  },
})
