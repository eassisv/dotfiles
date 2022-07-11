vim.o.guifont = 'Iosevka:h15'

vim.cmd "au BufWritePost  ~/.config/nvim/*.lua source %"

vim.cmd "set clipboard+=unnamedplus"

vim.cmd "source ~/.config/nvim/basic.vim"

require('packer-conf')
require('core.plugins')
require('plugins')
require('lsp')

vim.cmd "colorscheme falcon"

vim.o.relativenumber = true
vim.o.number = true
vim.o.mouse = 'nv'

vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true})

-- TODO: criar um comand InstallLang <lsp_server> para instalar e habilitar o lsp de uma linguagem

