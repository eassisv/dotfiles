vim.o.guifont = 'Iosevka:h15'

vim.cmd "set clipboard+=unnamedplus"

require('options')
require('mappings')
require('packer-conf')
require('plugins')
require('lsp')

vim.cmd "source ~/.config/nvim/basic.vim"
vim.cmd "colorscheme falcon"

vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true})


-- TODO: criar um comand InstallLang <lsp_server> para instalar e habilitar o lsp de uma linguagem

