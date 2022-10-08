local options = {
  opt = {
    backspace = vim.opt.backspace + { "nostop" },
    whichwrap = vim.opt.whichwrap + "<,>,h,l,[,]",
    clipboard = "unnamedplus",
    completeopt = { "menu", "menuone", "noselect" },
    copyindent = true,
    cursorline = true,
    expandtab = true,
    fileencoding = "utf-8",
    fillchars = { eob = " " },
    history = 100,
    ignorecase = true,
    laststatus = 3,
    lazyredraw = true,
    mouse = "a",
    number = true,
    preserveindent = true,
    pumheight = 10,
    relativenumber = true,
    scrolloff = 8,
    shiftwidth = 2,
    showmode = false,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartcase = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 2,
    termguicolors = true,
    undofile = true,
    updatetime = 300,
    spell = true,
    spelllang = "en_us,pt_br",
  },
  g = {
    mapleader = " ",
  },
}

for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*", -- disable spellchecking in the embeded terminal
  command = "setlocal nospell",
})
