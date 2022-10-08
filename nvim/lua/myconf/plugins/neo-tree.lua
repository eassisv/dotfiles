vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require('neo-tree').setup({
  window = {
    width = 30,
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

require('mappings').nmap('<leader>tt', ':Neotree toggle<cr>')

vim.cmd([[
highlight! link NeoTreeDirectoryIcon NvimTreeFolderIcon
highlight! link NeoTreeDirectoryName NvimTreeFolderName
highlight! link NeoTreeSymbolicLinkTarget NvimTreeSymlink
highlight! link NeoTreeRootName NvimTreeRootFolder
highlight! link NeoTreeDirectoryName NvimTreeOpenedFolderName
highlight! link NeoTreeFileNameOpened NvimTreeOpenedFile
]])
