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

  ["c"] = '"0c',
  ["s"] = '"0s',

  ["<leader>ot"] = ":15split +term<cr>",

  ["<leader><leader>s"] = ":so %<cr>"
}

local v = {
  -- Move lines and selections
  ["<M-j>"] = ":m'>+<cr>`<my`>mzgv`yo`z",
  ["<M-k>"] = ":m'<-2<cr>`<my`>mzgv`yo`z",

  ["c"] = '"0c',
  ["s"] = '"0s',
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

return M
