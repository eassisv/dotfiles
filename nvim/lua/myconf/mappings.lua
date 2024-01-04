local map = vim.keymap.set

-- TODO: merge options
local function _map(mode)
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", { silent = true, noremap = true }, opts or {})
    map(mode, lhs, rhs, opts)
  end
end

local nmap = _map("n")
local vmap = _map("v")

nmap("<leader>w", ":w!<cr>", { desc = "Quick save" })
nmap("<leader>l", ":nohl<cr>", { desc = "No highlight!" })
nmap(",,s", ":so %<cr>", { silent = false, desc = "Reload config file" })

-- windows change
nmap("<C-j>", "<C-W>j", { desc = "Move to window below" })
nmap("<C-k>", "<C-W>k", { desc = "Move to window above" })
nmap("<C-h>", "<C-W>h", { desc = "Move to left window" })
nmap("<C-l>", "<C-W>l", { desc = "Move to right window" })

-- move lines
nmap("<M-j>", "mz:m+<cr>`z", { desc = "Move line up" })
nmap("<M-k>", "mz:m-2<cr>`z", { desc = "Move line down" })

nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")

-- nmap("<leader>te", ":Explore<cr>")

-- Move lines and selections
vmap("<M-j>", ":m'>+<cr>`<my`>mzgv`yo`z", { desc = "Move selection up" })
vmap("<M-k>", ":m'<-2<cr>`<my`>mzgv`yo`z", { desc = "Move selection down" })

vim.cmd("tnoremap <C-[> <C-\\><C-n>")

local netrw_mappings_group = vim.api.nvim_create_augroup("NetrwMappings", {})
vim.api.nvim_create_autocmd("FileType", {
  group = netrw_mappings_group,
  pattern = "netrw",
  callback = function(args)
    nmap("l", "<cr>", { silent = true, remap = true, buffer = args.buf })
  end,
})

local M = {
  nmap = nmap,
  vmap = vmap,
}

return M
