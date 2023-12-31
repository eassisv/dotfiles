return {
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true,
      current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d>",
      preview_config = {
        border = "rounded",
      },
    },
  },
  { "kylechui/nvim-surround", event = { "VeryLazy" }, config = true },
  { "windwp/nvim-autopairs", event = { "InsertEnter" }, config = true },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>te", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree explorer" },
      { "<leader>tfe", "<cmd>NvimTreeFindFile<cr>", desc = "Open NvimTree explorer on current file" },
    },
    config = function()
      require("nvim-tree").setup({
        sync_root_with_cwd = true,
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = { "ToggleTerm" },
    keys = {
      { "<c-\\>", "<cmd>ToggleTerm<cr>", mode = { "n", "t", "i" }, desc = "Toggle terminal" },
    },
  },
}
