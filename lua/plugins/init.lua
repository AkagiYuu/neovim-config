local fn = vim.fn

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
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({
				border = "single",
			})
		end,
	},
})

-- Plugin
return packer.startup(function(use)
	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")
	use("nvim-lua/plenary.nvim")

	use("wbthomason/packer.nvim")

	use({
		"dstein64/vim-startuptime",
		cmd = { "StartupTime" }
	})

	-- Theme
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use({
		"rebelot/kanagawa.nvim",
	})
	-- use("Mofiqul/vscode.nvim")
	-- use({"themercorp/themer.lua"})

	use({
		"kyazdani42/nvim-web-devicons",
		event = { "BufRead", "BufNewFile" },
	})

	-- use({
	-- 	"feline-nvim/feline.nvim",
	-- 	config = function() require("plugins.config.feline") end,
	-- 	after = "nvim-web-devicons",
	-- })

	use({
		"tamton-aquib/staline.nvim",
		config = function() require("plugins.config.staline") end,
		after = "nvim-web-devicons",
	})

	use({
		"akinsho/bufferline.nvim",
		config = function() require("plugins.config.bufferline") end,
		after = "nvim-web-devicons",
	})
	--    use({
	-- 	"NTBBloodbath/galaxyline.nvim",
	--  config = function() require("plugin.config.galaxy-line") end,
	-- 	event = "BufWinEnter",
	-- })

	use({
		"rcarriga/nvim-notify",
		config = function() require("plugins.config.notify") end,
		event = { "BufRead", "BufNewFile" },
	})


	use({
		"neovim/nvim-lspconfig",
		requires = "hrsh7th/cmp-nvim-lsp",
		config = function() require("plugins.config.lspconfig") end,
      	event = { "BufReadPre" , "BufNewFile" },
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
            require("plugins.config.fidget")
		end,
		after = "nvim-lspconfig" ,
		event = { "BufRead", "BufNewFile" },
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function() require("plugins.config.null-ls") end,
		after = "nvim-lspconfig"
	})

	-- Auto completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "L3MON4D3/LuaSnip", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "rafamadriz/friendly-snippets", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
		},
		config = function() require("plugins.config.nvim-cmp") end,
		event = { "BufRead", "BufNewFile" },
	})
	use({ "github/copilot.vim", event = "InsertCharPre" })


	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function() require("plugins.config.treesitter") end,
		event = { "BufRead", "BufNewFile" }
	})

	use({
		"p00f/nvim-ts-rainbow",
		after = "nvim-treesitter",
	})
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
	})

	-- use({
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	requires = { { "nvim-lua/plenary.nvim" }, { "nvim-treesitter/nvim-treesitter" } },
	-- 	config = function()
	-- 		require("refactoring").setup({})
	-- 	end,
	-- 	event = "BufWinEnter",
	-- })


	use({
		"windwp/nvim-autopairs",
		event = "InsertCharPre",
		config = function() require("plugins.config.auto-pairs") end,
	})

	-- Action menu
	use({
		"tami5/lspsaga.nvim",
		event = { "BufRead", "BufNewFile" },
		config = function() require("plugins.config.lspsaga_config") end,
	})

	-- Diagnostic
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
		cmd = { "TroubleToggle", "Trouble", "TroubleRefresh" },
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function() require("plugins.config.indent") end,
		event = { "BufRead", "BufNewFile" }
	})

	-- Zen mode
	use({
		"folke/zen-mode.nvim",
		-- https://github.com/folke/twilight.nvim/issues/15
		requires = { { "folke/twilight.nvim", after = "zen-mode.nvim" } },
		cmd = "ZenMode",
	})

	-- Better cursor move
	use({
		"ggandor/lightspeed.nvim",
		event = { "BufRead", "BufNewFile" }
	})

	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		config = function() require("plugins.config.nvim-tree") end,
		-- cmd = { "NvimTreeOpen", "NvimTreeFocus", "NvimTreeToggle" },
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"sidebar-nvim/sidebar.nvim",
		config = function() require("plugins.config.sidebar") end,
		cmd = { "SidebarNvimToggle", "SidebarNvimOpen", "SidebarNvimUpdate", "SidebarNvimFocus" },
	})

	--Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function() require("gitsigns").setup() end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
	})

	use({
		"numToStr/Comment.nvim",
		keys = {
			{ "n", "gcc" },
			{ "n", "gbc" },
			{ "v", "gc" },
			{ "v", "gb" },
		},
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		config = function() require("todo-comments").setup() end,
		event = { "BufRead", "BufNewFile" },
	})

	-- Document generate
	-- use({
	-- 	'danymat/neogen',
	-- 	config = function()
	-- 		require('neogen').setup({
	-- 			enabled = true,
	-- 		})
	-- 	end,
	-- 	requires = 'nvim-treesitter/nvim-treesitter',
	-- })

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		event = { "BufRead", "BufNewFile" },
		cmd = "Telescope",
	})

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		after = "telescope-fzf-native.nvim",
	})
	use({
		"nvim-telescope/telescope.nvim",
		after = "telescope-fzf-native.nvim",
		config = function() require("plugins.config.telescope") end,
	})


	use({
		"yamatsum/nvim-cursorline",
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		cmd = "ColorizerToggle",
	})

	use({
		"folke/which-key.nvim",
		config = function() require("plugins.config.whichkey") end,
		event = { "BufRead", "BufNewFile" }
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
