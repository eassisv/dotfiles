---@diagnostic disable: missing-fields

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      {
        'github/copilot.vim',
        config = function()
          vim.g.copilot_node_command = NODE_BIN
          vim.g.copilot_no_tab_map = true

          vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")',
            { expr = true, silent = true, noremap = true, replace_keycodes = false, desc = 'Accept Copilot suggestion' })
        end
      },
    },
    build = "make tiktoken",
    config = function()
      local cchat = require('CopilotChat')

      cchat.setup()

      vim.keymap.set('n', '<leader>cc', function()
        cchat.toggle()
      end, { desc = 'Toggle CopilotChat' })
    end
  },
}
