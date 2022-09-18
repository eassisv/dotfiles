require'bufferline'.setup {
  options = {
    animation = true,
    auto_hide = true,
    closable = true,
    clickable = true,
    icons = true,
    maximum_padding = 1,
    maximum_length = 30,
    semantic_letters = true,
  },
}

local opts = { noremap = true, silent = true }

-- Move to previous/next
vim.api.nvim_set_keymap('n', '[t', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', ']t', '<Cmd>BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)

