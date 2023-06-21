vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.loader.enable()

require("myconf.options")
require("myconf.mappings")
require("myconf.lazy")

local function color_my_editor(color, transparent)
	local set_colors = function()
		if type(color) == "function" then
			color()
		else
			vim.cmd.colorscheme(color)
		end
	end

	local ok, _ = pcall(set_colors)

	if not ok then
		vim.notify("Cannot load colorscheme " .. vim.inspect(color), vim.log.levels.ERROR)
		vim.cmd.colorscheme("habamax")
	end

	if transparent ~= false then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true })
end

color_my_editor("sonokai")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local vim_enter_group = augroup("CdWhenOpenWithDir", {})
autocmd("VimEnter", {
	group = vim_enter_group,
	callback = function()
		if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			vim.cmd(":cd " .. vim.fn.argv(0))
		end
	end,
})

local on_term_open_group = augroup("OnTermOpen", {})
autocmd("TermOpen", {
	group = on_term_open_group,
	pattern = "*",
	command = "setlocal nospell",
})

local qf_group = augroup("QfGroup", {})
autocmd("FileType", {
	group = qf_group,
	pattern = "qf",
	callback = function(args)
		autocmd("BufLeave", {
			once = true,
			command = "bd!",
			buffer = args.buf,
		})
	end,
})

local yank_group = augroup("YankGroup", {})
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 70,
		})
	end,
})
