require('bufferline').setup {
  options = {
    mode = "buffers",
    numbers = function(opts)
      return opts.raise(opts.ordinal)
    end,
    indicator = { style = "underline" },
    diagnostics = "nvim_lsp",
    always_show_bufferline = false
  },
}

local nmap = require('core.utils').nmap

-- Move to previous/next
nmap('[t', '<Cmd>BufferLineCyclePrev<CR>')
nmap(']t', '<Cmd>BufferLineCycleNext<CR>')
nmap('<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
nmap('<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
nmap('<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
nmap('<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
nmap('<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
nmap('<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
nmap('<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
nmap('<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
nmap('<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')
