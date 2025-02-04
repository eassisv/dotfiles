local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local vim_enter_group = augroup('CdWhenOpenWithDir', {})
autocmd('VimEnter', {
  group = vim_enter_group,
  callback = function()
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      vim.cmd(':cd ' .. vim.fn.argv(0))
    end
  end,
})

local on_term_open_group = augroup('OnTermOpen', {})
autocmd('TermOpen', {
  group = on_term_open_group,
  pattern = '*',
  command = 'setlocal nospell',
})

local qf_group = augroup('QfGroup', {})
autocmd('FileType', {
  group = qf_group,
  pattern = { 'qf', 'fugitive', 'git' },
  callback = function(args)
    autocmd('BufLeave', {
      once = true,
      command = 'bd!',
      buffer = args.buf,
    })
  end,
})

local yank_group = augroup('YankGroup', {})
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 70 }) end,
})

autocmd('FileWritePost', {
  group = augroup('PreventFileWriteMistake', {}),
  pattern = '1',
  callback = function(opts)
    print(opts.file)

    vim.system({ 'rm', '-f', opts.file }):wait()
  end,
})
