local n = {
  ['<leader>w'] = ':w!<cr>',
  ['<C-j>'] = '<C-W>j',
  ['<C-k>'] = '<C-W>k',
  ['<C-h>'] = '<C-W>h',
  ['<C-l>'] = '<C-W>l',

  ['<leader>ff'] = '<cmd>Telescope find_files<cr>',
  ['<leader>fg'] = '<cmd>Telescope live_grep<cr>',
  ['\\'] = '<cmd>Telescope buffers<cr>',
  ['<leader>fh'] = '<cmd>Telescope help_tags<cr>',
  ['<leader>tt'] = '<cmd>NvimTreeToggle<cr>',

  ['<leader>e'] = '<cmd>Lspsaga show_line_diagnostics<cr>',
  ['<leader>ca'] = '<cmd>Lspsaga code_action<cr>',
}

vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga show_cursor_diagnostics<cr>')

local t = {
  ['<C-[>'] = '<C-\\><C-n>',
  ['Esc'] = '<C-\\><C-n>',
}

local mappings = { n = n, t = t }

for mode, mapping in pairs(mappings) do
  for lhs, rhs in pairs(mapping) do
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
  end
end
