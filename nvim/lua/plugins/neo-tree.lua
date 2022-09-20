vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require('neo-tree').setup({
  window = {
    mappings = {
      ["o"] = "open"
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignore = false,
      },
      group_empty_dirs = true,
    }
  }
})