local ok, impatient = pcall(require, "impatient")

if not ok then
  print("impatient was not installed yet")
else
  impatient.enable_profile()
end

require("myconf.options")
require("myconf.packer-conf")
require("myconf.colors")
require("myconf.plugins")
require("myconf.mappings")
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
