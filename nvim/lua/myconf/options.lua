vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.showmode = false
vim.o.breakindent = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.jumpoptions = 'stack'

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', eol = '↲' }

vim.opt.mouse = 'a'
vim.opt.scrolloff = 7
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.undofile = true
vim.opt.history = 400

vim.opt.updatetime = 250

vim.opt.spelllang = 'en_us,pt_br'
vim.opt.spelloptions = 'camel,noplainbuffer'
vim.opt.spell = true

vim.o.shortmess = vim.o.shortmess .. 'I'
