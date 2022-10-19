local plugins = {
  "onedark",
  "tokyonight",
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
}

local setup_default_or_raise = function(plug_name)
  local ok, plugin = pcall(require, plug_name)
  if ok then
    plugin.setup()
  else
    vim.api.nvim_err_writeln(
      "Failed to setup module " .. plugin .. "\n" .. "Consider run :PackerSync or check for any typo"
    )
  end
end

for _, plugin in ipairs(plugins) do
  local ok, _ = pcall(require, "myconf.plugins." .. plugin)
  if not ok then
    setup_default_or_raise(plugin)
  end
end

vim.g.material_style = "darker"
vim.g.sonokai_style = "shusia"
vim.g.sonokai_transparent_background = 2
vim.g.moonflyTransparent = true

vim.cmd("colorscheme tokyonight")
