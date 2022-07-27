vim.o.guifont = 'Iosevka:h15'
vim.cmd "source ~/.config/nvim/basic.vim"
vim.cmd "colorscheme tender"

local options = {
    opt = {
        tabstop = 2,
        shiftwidth = 2,
        spell = true,
        spelllang = 'en_us,pt_br',
        clipboard = 'unnamedplus',
        mouse = 'a',
        number = true,
        relativenumber = true
    },
    g = {
        mapleader = ','
    }
}


for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end
