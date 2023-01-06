require("harpoon").setup()
require("telescope").load_extension("harpoon")

local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
local nmap = require("myconf.mappings").nmap

nmap("<leader>a", mark.add_file)
nmap("<leader>hf", ui.toggle_quick_menu)
nmap("<leader>1", function() ui.nav_file(1) end)
nmap("<leader>2", function() ui.nav_file(2) end)
nmap("<leader>3", function() ui.nav_file(3) end)
nmap("<leader>4", function() ui.nav_file(4) end)

