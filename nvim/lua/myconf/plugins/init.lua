require("myconf.packer-conf")

local plugins = {
  "tokyonight",
  "catppuccin",
  "telescope",
  "nvim-treesitter",
  "gitsigns",
  "bufferline",
  "nvim-tree",
  "trouble",
  "lualine",
  "cmp",
  "mason",
  "null-ls",
  "lsp_signature",
  "nvim-surround",
  "nvim-autopairs",
  "Comment",
  "exrc",
  "toggleterm",
  "fidget",
  "rose-pine",
}

local setup_default_or_raise = function(plug_name)
  local ok, plugin = pcall(require, plug_name)
  if ok then
    plugin.setup()
  else
    vim.api.nvim_err_writeln(
      "Failed to setup module " .. plug_name .. ": " .. "Consider run :PackerSync"
    )
  end
end

for _, plugin in ipairs(plugins) do
  local ok, _ = pcall(require, "myconf.plugins." .. plugin)
  if not ok then
    setup_default_or_raise(plugin)
  end
end

