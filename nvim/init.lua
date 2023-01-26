vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local ok, impatient = pcall(require, "impatient")

if not ok then
  print("impatient was not installed yet")
else
  impatient.enable_profile()
end

require("myconf.packer-conf")
require("myconf.options")
require("myconf.mappings")
require("myconf.colors")
require("myconf.plugins")
require("myconf.cmp")
require("myconf.lsp")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local on_term_open_group = augroup("OnTermOpen", {})
autocmd("TermOpen", {
  group = on_term_open_group,
  pattern = "*",
  command = "setlocal nospell",
})

local qf_group = augroup("QfGroup", {})
autocmd("FileType", {
  group = qf_group,
  pattern = "qf",
  callback = function(args)
    autocmd("BufLeave", {
      once = true,
      command = "bd!",
      buffer = args.buf,
    })
  end,
})

local yank_group = augroup("YankGroup", {})
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 70,
    })
  end,
})
