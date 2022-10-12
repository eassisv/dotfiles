local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
  ensure_installed = {
    "stylua",
  },
})

local sources = {}

mason_null_ls.setup_handlers({
  function(source)
    for _, type in ipairs({ "diagnostics", "formatting", "code_actions", "completion", "hover" }) do
      local builtin_ok, builtin = pcall(require, "null-ls.builtins." .. type .. "." .. source)
      if builtin_ok then
        table.insert(sources, builtin)
      end
    end
  end,
})

null_ls.setup({
  sources = sources,
})
