local M = {}
local map = vim.keymap.set

function M.nmap(lhs, rhs, opts)
  map("n", lhs, rhs, opts or { silent = true, noremap = true })
end

local n = {
  ["<leader>w"] = ":w!<cr>",
  ["<leader>l"] = ":nohl<cr>",

  -- windows change
  ["<C-j>"] = "<C-W>j",
  ["<C-k>"] = "<C-W>k",
  ["<C-h>"] = "<C-W>h",
  ["<C-l>"] = "<C-W>l",

  -- move lines
  ["<M-j>"] = "mz:m+<cr>`z",
  ["<M-k>"] = "mz:m-2<cr>`z",

  ["<leader>ot"] = ":15split +term<cr>",

  ["<leader><leader>s"] = ":so %<cr>",
  ["<leader>te"] = ":Explore<cr>",
}

local v = {
  -- Move lines and selections
  ["<M-j>"] = ":m'>+<cr>`<my`>mzgv`yo`z",
  ["<M-k>"] = ":m'<-2<cr>`<my`>mzgv`yo`z",
}

local t = {
  ["<C-[>"] = "<C-\\><C-n>",
  ["<Esc>"] = "<C-\\><C-n>",
}

local mappings = { n = n, v = v, t = t }

for mode, mapping in pairs(mappings) do
  for lhs, rhs in pairs(mapping) do
    vim.keymap.set(mode, lhs, rhs, { remap = false, silent = true })
  end
end

vim.cmd("tnoremap <C-[> <C-\\><C-n>")

local netrw_mappings_group = vim.api.nvim_create_augroup("NetrwMappings", {})
vim.api.nvim_create_autocmd("FileType", {
  group = netrw_mappings_group,
  pattern = "netrw",
  callback = function(args)
    M.nmap("l", "<cr>", { silent = true, remap = true, buffer = args.buf })
  end,
})

return M
