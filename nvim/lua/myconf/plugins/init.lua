if require("myconf.packer-conf").packer_bootstrap then
  return
end

local plugins = {
  "telescope",
  "nvim-treesitter",
  "gitsigns",
  "lualine",
  "cmp",
  "mason",
  "null-ls",
  "lsp_signature",
  "nvim-surround",
  "nvim-autopairs",
  "Comment",
  "exrc",
  "fidget",
  "rose-pine",
  "harpoon",
}

local setup_default_or_raise = function(plug_name)
  local ok, plugin = pcall(require, plug_name)
  if ok then
    plugin.setup()
  else
    vim.api.nvim_err_writeln("Failed to setup module " .. plug_name .. ": " .. "Consider run :PackerSync")
  end
end

for _, plugin in ipairs(plugins) do
  local ok, _ = pcall(require, "myconf.plugins." .. plugin)
  if not ok then
    setup_default_or_raise(plugin)
  end
end

require("tokyonight").setup({
  transparent = true,
  styles = {
    keywords = { italic = false },
  },
})

