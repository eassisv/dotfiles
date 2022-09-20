local ok, _ = pcall(require, 'impatient')

if not ok then
  print('impatient was not installed yet')
end

require('packer-conf')
require('options')
require('plugins')
require('lsp')
require('autocompletion')
require('mappings')

