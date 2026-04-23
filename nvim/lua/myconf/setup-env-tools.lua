local NODE_BIN = vim.env.HOME .. '/.nvm/versions/node/v24.11.0/bin/'

vim.env.PATH = NODE_BIN .. ':' .. vim.env.PATH

vim.g.node_host_prog = NODE_BIN
