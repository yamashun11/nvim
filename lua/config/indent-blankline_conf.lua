require("ibl").setup({
  scope = {
    enabled = false,
  },
})

require("ibl").overwrite({
  exclude = {
    filetypes = { "startify" },
  },
})
