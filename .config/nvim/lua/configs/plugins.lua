local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "none" }
    end,
  },
}

return packer.startup(function(use)
  -- Required
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" } -- Useful lua library

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" }

  -- Misc/editing
  use { "windwp/nvim-autopairs" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "lewis6991/gitsigns.nvim" }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "folke/which-key.nvim" }
  use {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end
  }

  -- Neorg
  use {
    "nvim-neorg/neorg",
    config = function ()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}
        }
      }
    end,
    tag = "*"
  }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "RRethy/vim-illuminate" }
  use { "onsails/lspkind.nvim" }
  use { "ray-x/lsp_signature.nvim" }
  use {
    "folke/trouble.nvim",
    config = function()
      require('trouble').setup()
    end
  }

  -- Completion
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  -- Snippets
  use { "L3MON4D3/LuaSnip" }

  -- Colorschemes
  use { "arcticicestudio/nord-vim" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
