local plugins = {
  'telescope',
  'nvim-treesitter',
  'gitsigns',
  'lualine',
  'bufferline',
  -- 'neo-tree',
  'nvim-tree',
  'mason',
  'spellsitter',
  'nvim-surround',
  'nvim-autopairs',
  'Comment',
  'exrc',
  'onedark',
  'trouble'
}

local setup_default_or_raise = function (plug_name)
  local ok, plugin = pcall(require, plug_name)
  if ok then
    plugin.setup()
  else
      vim.api.nvim_err_writeln(
        'Failed to setup module ' ..
        plugin ..
        '\n' ..
        'Consider run :PackerSync or check for any typo'
      )
  end
end

for _, plugin in ipairs(plugins) do
  local ok, _ = pcall(require, 'plugins.' .. plugin)
  if not ok then
    setup_default_or_raise(plugin)
  end
end
