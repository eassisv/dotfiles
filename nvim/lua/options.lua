local options = {
	opt = {
		clipboard = 'unnamedplus',

		tabstop = 2,
		shiftwidth = 2,

		spell = true,
		spelllang = 'en_us,pt_br',

		number = true,
		relativenumber = true,
		scrolloff = 7,
		mouse = 'a'
	},
	g = {
		mapleader = ',',
		material_style = "darker"
	}
}

for scope, table in pairs(options) do
	for setting, value in pairs(table) do
		vim[scope][setting] = value
	end
end

vim.cmd "colorscheme material"

