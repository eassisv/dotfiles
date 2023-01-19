local map = vim.keymap.set

local function _map(mode)
  return function(lhs, rhs, opts)
    map(mode, lhs, rhs, opts)
  end
end

local nmap = _map("n")
local vmap = _map("v")

nmap("<leader>w", ":w!<cr>")
nmap("<leader>l", ":nohl<cr>")
nmap(",,s", ":so %<cr>", { silent = false })

-- windows change
nmap("<C-j>", "<C-W>j")
nmap("<C-k>", "<C-W>k")
nmap("<C-h>", "<C-W>h")
nmap("<C-l>", "<C-W>l")

-- move lines
nmap("<M-j>", "mz:m+<cr>`z")
nmap("<M-k>", "mz:m-2<cr>`z")

nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")

nmap("<leader>te", ":Explore<cr>")
nmap("<leader>gs", ":Git<cr>")

-- Move lines and selections
vmap("<M-j>", ":m'>+<cr>`<my`>mzgv`yo`z")
vmap("<M-k>", ":m'<-2<cr>`<my`>mzgv`yo`z")

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
