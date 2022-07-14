local n = {
    ['<leader>w'] = ':w!<cr>',
    ['<C-j>'] = '<C-W>j',
    ['<C-k>'] = '<C-W>k',
    ['<C-h>'] = '<C-W>h',
    ['<C-l>'] = '<C-W>l',
    ['<leader>ff'] = '<cmd>Telescope find_files<cr>',
    ['<leader>fg'] = '<cmd>Telescope live_grep<cr>',
    ['<leader>fb'] = '<cmd>Telescope buffers<cr>',
    ['<leader>fh'] = '<cmd>Telescope help_tags<cr>',
    ['<leader>tt'] = '<cmd>NvimTreeToggle<cr>'
}

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
