require("nvim-tree").setup({
  disable_netrw = true,
  renderer = {
    indent_markers = {
      enable = true
    }
  },
  actions = {
    change_dir = {
      enable = false,
      restrict_above_cwd = true,
    }
  }
})

local nmap = require('core.utils').nmap

nmap('<leader>tt', '<Cmd>NvimTreeToggle<cr>')
nmap('<leader>tf', '<Cmd>NvimTreeFindFile<cr>')
nmap('<leader>tr', '<Cmd>NvimTreeRefresh<cr>')
