if require("myconf.packer-conf").packer_bootstrap then
  return
end

local nmap = require("myconf.mappings").nmap

require("Comment").setup()
require("nvim-surround").setup()
require("nvim-autopairs").setup()

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
nmap("<leader>ff", builtin.find_files, { desc = "Find File" })
nmap("<leader>fg", builtin.live_grep, { desc = "Find Grep" })
nmap("<leader>*", builtin.grep_string, { desc = "Find Current String" })
nmap("<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy Find String" })
nmap("<leader>sht", builtin.help_tags, { desc = "Search Help Tags" })
nmap("<leader>lr", builtin.lsp_references, { desc = "List LSP References" })
nmap("<leader>sd", builtin.diagnostics, { desc = "Search Workspace Diagnostic" })
nmap("<leader>sld", function()
  builtin.diagnostics({ bufnr = 0 }, { desc = "Search Diagnostic" })
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
