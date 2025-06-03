vim.keymap.set('n', '<leader>w', ':w!<cr>', { desc = 'Quick save' })
vim.keymap.set('n', '<leader>q', ':q!<cr>', { desc = 'Quick quit' })
vim.keymap.set('n', '<leader>l', ':nohl<cr>', { desc = 'No highlight!' })
vim.keymap.set('n', '<leader>so', ':so $MYVIMRC<cr>', { desc = 'Reload config file' })

-- windows change
vim.keymap.set('n', '<C-j>', '<C-W>j', { desc = 'Move to window below' })
vim.keymap.set('n', '<C-k>', '<C-W>k', { desc = 'Move to window above' })
vim.keymap.set('n', '<C-h>', '<C-W>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-l>', '<C-W>l', { desc = 'Move to right window' })

-- move lines
vim.keymap.set('n', '<M-j>', 'mz:m+<cr>`z', { desc = 'Move line up' })
vim.keymap.set('n', '<M-k>', 'mz:m-2<cr>`z', { desc = 'Move line down' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
vim.keymap.set('n', 'j', 'gj', { desc = 'Move down visual line' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Move up visual line' })

vim.keymap.set('n', '<leader>cp', function()
  local filename = vim.fn.expand('%:p')
  local cwd = vim.uv.cwd()

  if not cwd or not filename then
    return
  end

  local filepath_in_project = filename:sub(cwd:len() + 1)
  vim.fn.setreg('+', filepath_in_project)
  vim.notify('Copied file path: ' .. filepath_in_project, vim.log.levels.INFO)
end, { desc = 'Copy file path in project' })

-- Move lines and selections
vim.keymap.set('v', '<M-j>', ":m'>+<cr>`<my`>mzgv`yo`z", { desc = 'Move selection up' })
vim.keymap.set('v', '<M-k>', ":m'<-2<cr>`<my`>mzgv`yo`z", { desc = 'Move selection down' })

vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
