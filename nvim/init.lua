local ok, _ = pcall(require, 'impatient')

if not ok then
  print('impatient was not installed yet')
end

require('packer-conf')

require('core.options')
require('core.mappings')
require('core.autocompletion')

require('configs.plugins')
require('configs.lsp')

