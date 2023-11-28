-- Auto start deoplete package.
vim.g['deoplete#enable_at_startup'] = 1

-- call omni completion of vimtex from deoplete
vim.call('deoplete#custom#var', 'omni', 'input_patterns', {
  ['tex'] = vim.g['vimtex#re#deoplete']
})
