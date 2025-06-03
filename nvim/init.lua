require('myconf.options')
require('myconf.mappings')
require('myconf.autocmds')
require('myconf.lazy-init')
require('myconf.setup-env-tools')

vim.g.my_colorscheme = 'solarized-osaka'
vim.cmd.colorscheme(vim.g.my_colorscheme)
