local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('myconf.plugins', {
  performance = {
    rtp = {
      reset = false,
      disabled_plugins = { 'netrwPlugin' },
    },
  },
  install = {
    colorscheme = { vim.g.my_colorscheme },
  },
  change_detection = {
    notify = false,
  },
})
