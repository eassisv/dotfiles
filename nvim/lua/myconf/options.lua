vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', eol = '↲' }

vim.opt.mouse = 'a'
vim.opt.scrolloff = 7
vim.opt.completeopt = { 'menu', 'menuone', 'preview' }

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.undofile = true
vim.opt.history = 400
-- vim.opt.shada = { "'1000", 'f0', '<500', ':10', '%' }

vim.opt.updatetime = 250

vim.opt.spelllang = 'en_us,pt_br'
vim.opt.spelloptions = 'camel,noplainbuffer'
vim.opt.spell = true
