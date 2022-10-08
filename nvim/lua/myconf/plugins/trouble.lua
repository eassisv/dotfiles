require('trouble').setup({
  width = 40,
  action_keys = {
    jump = { '<cr>', 'o' },
    jump_close = { 'O' }
  },
  auto_close = true,
  use_diagnostic_signs = true
})

local nmap = require('mappings').nmap

nmap('<leader>qw', '<cmd>TroubleToggle<cr>')
nmap('<leader>qq', '<cmd>TroubleToggle document_diagnostics<cr>')

