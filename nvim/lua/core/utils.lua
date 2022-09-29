local M = {}
local map = vim.keymap.set

function M.nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts or { silent = true, noremap = true })
end

return M
