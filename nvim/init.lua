vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local ok, impatient = pcall(require, 'impatient')

if not ok then
  print('impatient was not installed yet')
else
  impatient.enable_profile()
end

require('packer-conf')

require('core.options')
require('core.mappings')
require('core.autocompletion')

require('configs.plugins')
require('configs.lsp')

