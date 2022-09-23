local fn = vim.fn

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("user/config/%s")', name)
end

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use({ "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }) -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Useful lua functions used by lots of plugins
  use({ "windwp/nvim-autopairs", config = get_config("autopairs"), commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }) -- Autopairs, integrates with both cmp and treesitter
  use({ "numToStr/Comment.nvim", config = get_config("comment"), commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" })
  use({ "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" })
  use({ "kyazdani42/nvim-tree.lua", config = get_config("nvim-tree"), commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
  use({ "akinsho/bufferline.nvim", config = get_config("bufferline"), commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" })
  use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
  use({ "nvim-lualine/lualine.nvim", config = get_config("lualine"), commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" })
  use({ "akinsho/toggleterm.nvim", config = get_config("toggleterm"), commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" })
  use({ "ahmedkhalf/project.nvim", config = get_config("project"), commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
  use({ "lewis6991/impatient.nvim", config = get_config("impatient"), commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
  use({ "lukas-reineke/indent-blankline.nvim", config = get_config("indent-blankline"),
    commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
  use({ "goolord/alpha-nvim", config = get_config("alpha-nvim"), commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })
  use({ "folke/which-key.nvim", config = get_config("whichkey") })
  use { "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end
  }
  use({
    "RRethy/vim-illuminate",
    config = function()
      require("user.config.illuminate").setup()
    end
  })



  -- Colorschemes

  use({ "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" })
  use("lunarvim/colorschemes")
  use("Mofiqul/dracula.nvim")
  use("lunarvim/darkplus.nvim")


  -- Copilot
  use({ "github/copilot.vim", config = get_config("copilot") })

  -- Coq
  use({ 'neoclide/coc.nvim',
    config = function()
      require('user.config.coc').setup()
    end,
    branch = 'release'
  })

  -- coc snippets
  use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use
  use({ "honza/vim-snippets" })


  -- Telescope
  use({ "nvim-telescope/telescope.nvim", config = get_config("telescope"),
    commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "sudormrfbin/cheatsheet.nvim",
    requires = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    }
  }

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", config = get_config("treesitter"),
    commit = "518e27589c0463af15463c9d675c65e464efc2fe" })

  -- Git
  use({ "lewis6991/gitsigns.nvim", config = get_config("gitsigns"), commit = "c18e016864c92ecf9775abea1baaa161c28082c3" })
  use({ 'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('user.config.neogit').setup() end
  })
  use({ "kdheepak/lazygit.nvim" })

  -- DAP
  use({
    "mfussenegger/nvim-dap",
    config = function()
      require("user.config.dap").setup()
    end
  })
  use({
    'rcarriga/nvim-dap-ui',
    requires = 'mfussenegger/nvim-dap',
    config = function()
      require('user.config.dapui').setup()
    end,
  })
  use({
    "Pocco81/dap-buddy.nvim",
    branch = "dev",
    -- event = "BufWinEnter",
    -- event = "BufRead",
  })
  use({
    'mfussenegger/nvim-dap-python',
    requires = 'mfussenegger/nvim-dap',
    config = function()
      require('user.config.dap-python').setup()
    end,
    ft = { 'python' },
  })

  -- Refactoring
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require("user.config.refactoring").setup()
    end
  }
  -- Markdown
  use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, })
  use { "ellisonleao/glow.nvim" }

  -- Note taking
  use({
    "jakewvincent/mkdnflow.nvim",
    rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
    config = function()
      require('mkdnflow').setup({})
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
