local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  print "Cloning packer .."
  packer_bootstrap = fn.system {
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Packer installed. Close and reopen Neovim."
  vim.cmd("packadd packer.nvim")
end

local present, packer = pcall(require, "packer")

if not present then
  return
end

return require("packer").startup(function(use)
  -- Essential plugins
  use { "lewis6991/impatient.nvim" }
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" }

  use { "kyazdani42/nvim-web-devicons" }

  -- Status line
  use {
    "nvim-lualine/lualine.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("plugins.configs.lualine")
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter")
    end
  }

  -- Lsp
  use {
    "neovim/nvim-lspconfig",
    module = "lspconfig",
    ft = { "c", "cpp" },
    config = function()
      require("plugins.configs.lspconfig")
    end,
  }

  -- Completion (snippets + cmp)
  use {
    "rafamadriz/friendly-snippets",
    module = "cmp_nvim_lsp",
    event = "InsertEnter",
  }

  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require("plugins.configs.nvim-cmp")
    end
  }

  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.luasnip")
    end
  }

  use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
  use { "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" }
  use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }
  use { "hrsh7th/cmp-path", after = "cmp-buffer" }

  -- Comments + autopairs
  use {
    "tpope/vim-commentary",
    keys = { "gc" },
    module = "Comment",
  }

  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.configs.nvim-autopairs")
    end
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    keys = { "<C-p>", "<leader>f" },
    cmd = { "Telescope" },
    config = function()
      require("plugins.configs.telescope")
    end
  }

  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- Transparency
  use {
    "xiyaowong/nvim-transparent",
    config = function()
      require("plugins.configs.nvim-transparent")
    end
  }

  -- Colorscheme
  use { "mhartington/oceanic-next" }

  -- Dashboard
  use {
    "goolord/alpha-nvim",
    disable = true,
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  -- Latex
  use { "lervag/vimtex", ft = "tex" }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
