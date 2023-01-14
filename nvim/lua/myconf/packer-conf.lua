local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use("lewis6991/impatient.nvim")
  use("nvim-lua/plenary.nvim")

  use("nvim-treesitter/nvim-treesitter")
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("ThePrimeagen/harpoon")

  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")
  use("b0o/SchemaStore.nvim")

  use("folke/trouble.nvim")
  use("ray-x/lsp_signature.nvim")
  use("j-hui/fidget.nvim")

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  use("rktjmp/lush.nvim")
  use("folke/tokyonight.nvim")
  use("rose-pine/neovim")

  use("kylechui/nvim-surround")
  use("windwp/nvim-autopairs")
  use("numToStr/Comment.nvim")

  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("nvim-lualine/lualine.nvim")

  use("gpanders/editorconfig.nvim")
  use("MunifTanjim/exrc.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)

local M = { packer_bootstrap = packer_bootstrap }
return M
