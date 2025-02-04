local map = vim.keymap.set

local function _map(mode)
  return function(lhs, rhs, opts)
    opts = vim.tbl_deep_extend('force', { silent = true, noremap = true }, opts or {})
    map(mode, lhs, rhs, opts)
  end
end

local nmap = _map('n')
local vmap = _map('v')

nmap('<leader>w', ':w!<cr>', { desc = 'Quick save' })
nmap('<leader>q', ':q!<cr>', { desc = 'Quick quit' })
nmap('<leader>l', ':nohl<cr>', { desc = 'No highlight!' })
nmap('<leader>so', ':so $MYVIMRC<cr>', { desc = 'Reload config file' })
nmap('<leader>x', ':so<cr>', { desc = 'Source current file' })

-- windows change
nmap('<C-j>', '<C-W>j', { desc = 'Move to window below' })
nmap('<C-k>', '<C-W>k', { desc = 'Move to window above' })
nmap('<C-h>', '<C-W>h', { desc = 'Move to left window' })
nmap('<C-l>', '<C-W>l', { desc = 'Move to right window' })

-- move lines
nmap('<M-j>', 'mz:m+<cr>`z', { desc = 'Move line up' })
nmap('<M-k>', 'mz:m-2<cr>`z', { desc = 'Move line down' })

nmap('<C-d>', '<C-d>zz')
nmap('<C-u>', '<C-u>zz')
map('', 'j', 'gj', { desc = 'Move down visual line' })
map('', 'k', 'gk', { desc = 'Move up visual line' })

nmap('<leader>cp', function()
  local filename = vim.fn.expand('%:p')
  local cwd = vim.uv.cwd()

  local filepath_in_project = filename:sub(cwd:len() + 1)
  vim.fn.setreg('+', filepath_in_project)
end, { desc = 'Copy file path in project' })

-- nmap("<leader>te", ":Explore<cr>")

-- Move lines and selections
vmap('<M-j>', ":m'>+<cr>`<my`>mzgv`yo`z", { desc = 'Move selection up' })
vmap('<M-k>', ":m'<-2<cr>`<my`>mzgv`yo`z", { desc = 'Move selection down' })

vim.cmd('tnoremap <C-[> <C-\\><C-n>')

local M = {
  nmap = nmap,
  vmap = vmap,
}

return M
