local plugins = {
    'statusline',
    'tabbar',
    'nvim-lsp-installer',
    'nvim-cmp',
    'nvim-tree',
    'spellsitter'
}

for _, plugin in ipairs(plugins) do
    local ok, err = pcall(require, 'plugins.' .. plugin)
    if not ok then 
        vim.api.nvim_err_writeln('Failed to load module ' .. plugin .. '\n' .. err)
    end
end
