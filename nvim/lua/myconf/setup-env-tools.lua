NODE_BIN = vim.env.NODE_BIN or vim.env.HOME .. '/.nvm/versions/node/v22.14.0/bin/node'

if vim.env.NODE_BIN ~= nil then
  vim.env.PATH = vim.env.NODE_BIN .. ':' .. vim.env.PATH
else
  vim.env.PATH = NODE_BIN .. vim.env.PATH
end
