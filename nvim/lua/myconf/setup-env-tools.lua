if vim.env.NODE_BIN ~= nil then
  vim.env.PATH = vim.env.NODE_BIN .. ':' .. vim.env.PATH
end
