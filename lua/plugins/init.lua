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

	use({ "dstein64/vim-startuptime", cmd = { "StartupTime" } })

	-- Theme
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("Mofiqul/vscode.nvim")

	use({
		"kyazdani42/nvim-web-devicons",
		event = { "BufRead", "BufNewFile" },
	})

	-- use({
	-- 	"tamton-aquib/staline.nvim",
	-- 	config = function()
	-- 		require("plugins.config.staline")
	-- 	end,
	-- 	after = "nvim-web-devicons",
	-- })
	use({
		"rebelot/heirline.nvim",
		config = function()
			require("plugins.config.heirline")
		end,
		after = "nvim-web-devicons",
	})

	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.config.bufferline")
		end,
		after = "nvim-web-devicons",
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			require("plugins.config.notify")
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lspconfig")
		end,
		event = { "BufReadPre", "BufNewFile" },
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("plugins.config.fidget")
		end,
		event = { "BufRead", "BufNewFile" },
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.null-ls")
		end,
		after = "nvim-lspconfig",
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "rafamadriz/friendly-snippets", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "lukas-reineke/cmp-rg", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
			{ "hrsh7th/cmp-calc", after = "nvim-cmp" },
		},
		config = function()
			require("plugins.config.nvim-cmp")
		end,
		event = { "BufRead", "BufNewFile" },
	})
	use({ "github/copilot.vim", event = "InsertCharPre" })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.config.treesitter")
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
	})
	use({
		"m-demare/hlargs.nvim",
		after = "nvim-treesitter",
		config = function()
			require("hlargs").setup()
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.config.auto-pairs")
		end,
		event = "InsertCharPre",
	})

	use({
		"tami5/lspsaga.nvim",
		config = function()
			require("plugins.config.lspsaga_config")
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
		cmd = { "TroubleToggle", "Trouble" },
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.config.indent")
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"folke/zen-mode.nvim",
		requires = { { "folke/twilight.nvim", after = "zen-mode.nvim" } },
		cmd = "ZenMode",
	})

	use({
		"ggandor/lightspeed.nvim",
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.config.nvim-tree")
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"sidebar-nvim/sidebar.nvim",
		config = function()
			require("plugins.config.sidebar")
		end,
		cmd = { "SidebarNvimToggle" },
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"nvim-telescope/telescope.nvim",
		after = "telescope-fzf-native.nvim",
		config = function()
			require("plugins.config.telescope")
		end,
	})

	use({
		"yamatsum/nvim-cursorline",
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.config.whichkey")
		end,
		event = { "BufRead", "BufNewFile" },
	})
end)
