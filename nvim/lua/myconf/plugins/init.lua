if require("myconf.packer-conf").packer_bootstrap then
  return
end

local nmap = require("myconf.mappings").nmap

local plugins = {
  "cmp",
  "lsp_signature",
  "fidget",
  "harpoon",
}

require("myconf.plugins.cmp")

require("Comment").setup()
require("nvim-surround").setup()
require("nvim-autopairs").setup()
require("exrc").setup()

require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "vim" },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

require("telescope").setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

require("telescope").load_extension("fzf")
local builtin = require("telescope.builtin")

nmap("<leader>ff", builtin.find_files)
nmap("<leader>fg", builtin.live_grep)
nmap("<leader>*", builtin.grep_string)
nmap("\\", builtin.buffers)
nmap("<leader>fht", builtin.help_tags)
nmap("<leader>lr", builtin.lsp_references)

require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>",
  preview_config = {
    border = "rounded",
  },
})

require("lualine").setup({
  options = { theme = "auto" },
})
