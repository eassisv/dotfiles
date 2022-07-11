local plugins = {
    'plugins.statusline',
    'plugins.tabbar',
    'plugins.nvim-lsp-installer',
    'plugins.nvim-cmp',
}

for _, plugin in ipairs(plugins) do
    local ok, err = pcall(require, plugin)
    if not ok then 
        vim.api.nvim_err_writeln('Failed to load module ' .. plugin .. '\n' .. err)
    end
end
