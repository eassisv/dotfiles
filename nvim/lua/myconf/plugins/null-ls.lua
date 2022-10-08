local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")
local builtins = null_ls.builtins

mason_null_ls.setup({
  ensure_installed = {
    "stylua",
  },
})

mason_null_ls.setup_handlers({
  function(source)
    for _, builtin in ipairs({ "diagnostics", "formatting", "code_actions", "completion", "hover" }) do
      if vim.tbl_contains(vim.tbl_keys(builtins[builtin]), source) then
        null_ls.setup(builtins[builtin][source])
      end
    end
  end,
})

null_ls.setup({
  sources = {
    builtins.formatting.stylua,
  },
})
