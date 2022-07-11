require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'lua', 'vim', 'javascript', 'python', 'html', 'css' },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
