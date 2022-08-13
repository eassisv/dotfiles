local plugins = {
    'statusline',
    'nvim-lsp-installer',
    'nvim-tree',
    'telescope',
    'nvim-treesitter',
    'lspsaga',
}

require('nvim-tree').setup()

for _, plugin in ipairs(plugins) do
    local ok, err = pcall(require, 'plugins.' .. plugin)
    if not ok then
        vim.api.nvim_err_writeln('Failed to load module ' .. plugin .. '\n' .. err)
    end
end

