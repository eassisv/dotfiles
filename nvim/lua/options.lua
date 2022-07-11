local options = {
    opt = {
        spell = true,
        spelllang = 'en_us,pt_br',
        clipboard = 'unnamedplus',
        mouse = 'a',
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
