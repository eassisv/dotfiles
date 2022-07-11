local modules = {
    'plugins'
}

for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    if not ok then 
        vim.api.nvim_err_writeln('Failed to load module ' .. modules .. '\n' .. err)
    end
end
