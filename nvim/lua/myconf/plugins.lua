if require("myconf.packer-conf").packer_bootstrap then
  return
end

local nmap = require("myconf.mappings").nmap

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

nmap("\\", builtin.buffers)
nmap("<leader>sf", builtin.find_files)
nmap("<leader>lg", builtin.live_grep)
nmap("<leader>*", builtin.grep_string)
nmap("<leader>bff", builtin.current_buffer_fuzzy_find)
nmap("<leader>sht", builtin.help_tags)
nmap("<leader>lr", builtin.lsp_references)
nmap("<leader>sd", builtin.diagnostics)
nmap("<leader>sld", function()
  builtin.diagnostics({ bufnr = 0 })
end)

require("harpoon").setup()
require("telescope").load_extension("harpoon")

local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

nmap("<leader>a", mark.add_file)
nmap("<leader>hf", ui.toggle_quick_menu)
nmap("<leader>1", function()
  ui.nav_file(1)
end)
nmap("<leader>2", function()
  ui.nav_file(2)
end)
nmap("<leader>3", function()
  ui.nav_file(3)
end)
nmap("<leader>4", function()
  ui.nav_file(4)
end)
nmap("[m", ui.nav_prev)
nmap("]m", ui.nav_next)

require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>",
  preview_config = {
    border = "rounded",
  },
})

require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "auto",
    component_separators = "|",
    section_separators = "",
  },
})
