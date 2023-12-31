local nmap = require("myconf.mappings").nmap

local lsp_format = function(bufnr)
  vim.lsp.buf.format({
    async = true,
    bufnr = bufnr,
    filter = function(client)
      local priorize_null_ls = false
      local null_ls_attached_clients = vim.lsp.get_active_clients({ bufnr = bufnr, name = "null-ls" })

      for _, attached_client in ipairs(null_ls_attached_clients) do
        priorize_null_ls = priorize_null_ls or attached_client.supports_method("textDocument/formatting")
      end

      if priorize_null_ls then
        return client.name == "null-ls"
      end

      return true
    end,
  })
end

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nmap("gD", vim.lsp.buf.declaration, bufopts)
  nmap("gd", vim.lsp.buf.definition, bufopts)
  nmap("gi", vim.lsp.buf.implementation, bufopts)
  nmap("K", vim.lsp.buf.hover, bufopts)
  nmap("gi", vim.lsp.buf.implementation, bufopts)
  nmap("<c-s>", vim.lsp.buf.signature_help, bufopts)
  nmap("<leader>D", vim.lsp.buf.type_definition, bufopts)
  nmap("<leader>rn", vim.lsp.buf.rename, bufopts)
  nmap("<leader>ca", vim.lsp.buf.code_action, bufopts)
  nmap("<leader>fd", vim.lsp.buf.format, bufopts)
end

return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "lua_ls", "tsserver", "pyright" },
        },
      },
    },
    config = function()
      vim.diagnostic.config({
        underline = true,
        virtual_text = true,
        severity_sort = true,
        update_in_insert = true,
        float = { border = "rounded", style = "minimal", source = true },
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      nmap("<leader>e", vim.diagnostic.open_float)
      nmap("[d", vim.diagnostic.goto_prev)
      nmap("]d", vim.diagnostic.goto_next)

      local lsp = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local setup_server = function(server)
        local options = {
          flags = { debounce_text_changes = 150 },
          on_attach = on_attach,
          capabilities = capabilities,
        }

        if server == "lua_ls" then
          options.settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          }
        end

        if server == "jsonls" then
          options.settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          }
        end

        lsp[server].setup(options)
      end

      require("mason-lspconfig").setup_handlers({
        setup_server,
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "jose-elias-alvarez/null-ls.nvim", config = true },
    },
    opts = {
      automatic_setup = true,
      handlers = {},
    },
  },
  { "b0o/SchemaStore.nvim",     lazy = true },
  { "folke/trouble.nvim",       cmd = { "Trouble", "TroubleToggle" } },
  { "ray-x/lsp_signature.nvim", cmd = { "LspAttach" },               opts = { bind = true } },
  {
    "j-hui/fidget.nvim",
    event = { "LspAttach" },
    opts = { text = { spinner = "dots" } },
    branch = "legacy",
  },
}
