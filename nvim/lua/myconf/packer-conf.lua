local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local function install(use)
  use("wbthomason/packer.nvim")

  use("nvim-treesitter/nvim-treesitter")

  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")
  use("b0o/SchemaStore.nvim")
  use("folke/trouble.nvim")
  use("onsails/lspkind.nvim") -- Lsp UI
  use("ray-x/lsp_signature.nvim")
  use("j-hui/fidget.nvim")

  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")

  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- ui
  use("rktjmp/lush.nvim")
  use("sainnhe/sonokai")
  use("sainnhe/gruvbox-material")
  use("folke/tokyonight.nvim")
  use("catppuccin/nvim")
  use("sainnhe/edge")
  use("rose-pine/neovim")
  --

  use("kyazdani42/nvim-web-devicons")

  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("kylechui/nvim-surround")
  use("windwp/nvim-autopairs")

  use("numToStr/Comment.nvim")

  use("akinsho/bufferline.nvim")
  use("gpanders/editorconfig.nvim")
  use("lewis6991/impatient.nvim")
  use("lewis6991/gitsigns.nvim")
  use("MunifTanjim/exrc.nvim")
  use("stevearc/dressing.nvim")
  use("akinsho/toggleterm.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end

return require("packer").startup({
  install,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
      -- prompt_border = "rounded",
      keybindings = {
        quit = "<Esc>",
      },
    },
  }
  ,
})
