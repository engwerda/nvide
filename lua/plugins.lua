local fn = vim.fn

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
	return string.format('require("config/%s")', name)
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
		end,
	})

	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({
		"windwp/nvim-autopairs",
		config = get_config("autopairs"),
	}) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", config = get_config("comment") })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"kyazdani42/nvim-tree.lua",
		config = get_config("nvim-tree"),
	})
	use({
		"akinsho/bufferline.nvim",
		config = get_config("bufferline"),
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "moll/vim-bbye" })
	use({
		"nvim-lualine/lualine.nvim",
		config = get_config("lualine"),
	})
	use({
		"ahmedkhalf/project.nvim",
		config = get_config("project"),
	})
	use({
		"lewis6991/impatient.nvim",
		config = get_config("impatient"),
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = get_config("indent-blankline"),
	})
	use({ "goolord/alpha-nvim", config = get_config("alpha-nvim") })
	use({ "folke/which-key.nvim", config = get_config("whichkey") })

	use({
		"anuvyklack/windows.nvim",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require("windows").setup()
		end,
	})
	use({
		"RRethy/vim-illuminate",
		config = function()
			require("config.illuminate").setup()
		end,
	})
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
		config = function()
			require("config.ufo").setup()
		end,
	})
	-- Template language support
	-- Jinja2 and Nunjucks support
	--[[ use({ ]]
	--[[   "Glench/Vim-Jinja2-Syntax", ]]
	--[[ }) ]]

	-- Motion
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("config.hop").setup()
		end,
	})
	use({ "matze/vim-move" })

	-- Tags
	use({
		"liuchengxu/vista.vim",
	})
	-- Notify

	--[[ use({ ]]
	--[[ 	"rcarriga/nvim-notify", ]]
	--[[ 	config = function() ]]
	--[[ 		require("config.notify").setup() ]]
	--[[ 	end, ]]
	--[[ }) ]]

	-- Terminal and Tmux
	use({
		"akinsho/toggleterm.nvim",
		config = get_config("toggleterm"),
	})
	use({
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	})

	-- Colorschemes

	-- use("folke/tokyonight.nvim")
	-- use("lunarvim/colorschemes")
	-- use("Mofiqul/dracula.nvim")
	-- use("lunarvim/darkplus.nvim")
	-- use({ "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" })
	use({
		"ray-x/starry.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		setup = function()
			vim.g.starry_italic_comments = true
			vim.g.starry_italic_keywords = true
			vim.g.starry_italic_functions = false
			vim.g.starry_italic_variables = false
			vim.g.starry_italic_string = false
			vim.g.starry_italic_boolean = true
			vim.g.starry_darker_contrast = true
			vim.g.tarry_style = "moonlight"
			vim.cmd([[colorscheme dracula]])
		end,
	})

	-- Copilot
	-- use({ "github/copilot.vim", config = get_config("copilot") })

	-- Codeium
	use({
		"Exafunction/codeium.vim",
		config = function()
		end,
	})

	-- Coq
	use({
		"neoclide/coc.nvim",
		config = function()
			require("config.coc").setup()
		end,
		branch = "release",
	})

	-- coc snippets
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
	use({ "honza/vim-snippets" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = get_config("telescope"),
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "fannheyward/telescope-coc.nvim" })
	use({
		"sudormrfbin/cheatsheet.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = get_config("treesitter"),
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = get_config("gitsigns"),
	})
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("config.neogit").setup()
		end,
	})
	use({ "kdheepak/lazygit.nvim" })
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	})
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- DAP
	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("config.dap").setup()
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = "mfussenegger/nvim-dap",
		config = function()
			require("config.dapui").setup()
		end,
	})
	use({
		"Pocco81/dap-buddy.nvim",
		branch = "dev",
		-- event = "BufWinEnter",
		-- event = "BufRead",
	})
	use({
		"mfussenegger/nvim-dap-python",
		requires = "mfussenegger/nvim-dap",
		config = function()
			require("config.dap-python").setup()
		end,
		ft = { "python" },
	})

	-- Refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("config.refactoring").setup()
		end,
	})
	use({
		"python-rope/ropevim",
		ft = "python",
	})
	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use({ "ellisonleao/glow.nvim" })
	use({ "jxnblk/vim-mdx-js" })

	-- color highlighter for Neovim
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- Note taking
	use({
		"jakewvincent/mkdnflow.nvim",
		rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
		config = function()
			require("mkdnflow").setup({})
		end,
	})

	-- Scratch files
	use({
		"Sonicfury/scretch.nvim",
		requires = "nvim-telescope/telescope.nvim",
		config = function()
			require("scretch").setup({})
		end,
	})

	-- Search with specre.nvim
	use({
		"windwp/nvim-spectre",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("config.spectre").setup()
		end,
	})

	-- Code evaluation
	use({ "michaelb/sniprun", run = "bash ./install.sh" })

	-- NeOrg
	-- use({
	-- 	"nvim-neorg/neorg",
	-- 	tag = "v1.0.1",
	-- 	run = ":Neorg sync-parsers",
	-- 	config = function()
	-- 		require("config.neorg").setup()
	-- 	end,
	-- 	requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope", "max397574/neorg-contexts" },
	-- })

	-- Zen mode
	use({
		"Pocco81/true-zen.nvim",
		requires = { "folke/twilight.nvim" },
		config = function()
			require("true-zen").setup({})
		end,
	})

	-- ChatGPT
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("config.chatgpt").setup({
				-- optional configuration
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	use({
		"dense-analysis/neural",
		config = function()
			require("config.neural").setup({})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"ElPiloto/significant.nvim",
			"dense-analysis/ale",
		},
	})
	--[[ use ({  ]]
	--[[   'codota/tabnine-nvim', ]]
	--[[   run = "./dl_binaries.sh", ]]
	--[[   config = function() ]]
	--[[     require("config.tabnine").setup() ]]
	--[[   end, ]]
	--[[ }) ]]

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
