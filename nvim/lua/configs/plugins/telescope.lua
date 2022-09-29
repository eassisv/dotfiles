local nmap = require('core.utils').nmap

nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
nmap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('\\\\', '<cmd>Telescope buffers<cr>')
