require('myconf.setup-env-tools')
require('myconf.options')
require('myconf.mappings')
require('myconf.autocmds')
require('myconf.lazy-init')

vim.g.my_colorscheme = 'tokyonight-day'
vim.cmd.colorscheme(vim.g.my_colorscheme)
