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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
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
			return require("packer.util").float({
				border = "single",
			})
		end,
	},
})

-- Plugin
return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Improve load time
	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")

	use("dstein64/vim-startuptime")

	use("nvim-lua/plenary.nvim")

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

	-- Icon
	use("kyazdani42/nvim-web-devicons")
	use("onsails/lspkind-nvim")

	use({
		"NTBBloodbath/galaxyline.nvim",
		event = "BufWinEnter",
	})

	use({
		"akinsho/bufferline.nvim",
		event = "BufWinEnter",
	})

	use({
		"goolord/alpha-nvim",
	})

	use({ "rcarriga/nvim-notify" })

	-- Lsp
	use({
		"neovim/nvim-lspconfig",
		requires = { "hrsh7th/cmp-nvim-lsp" },
		module = "lspconfig",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		module = "null-ls",
	})

	-- Progress
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				window = {
					blend = 0,
				},
			})
		end,
	})

	-- Auto completion

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{
				"L3MON4D3/LuaSnip",
				after = "nvim-cmp",
			},
			{
				"saadparwaiz1/cmp_luasnip",
                after = "nvim-cmp",
			},
			{
				"rafamadriz/friendly-snippets",
                after = "nvim-cmp",
			},
			{
				"hrsh7th/cmp-cmdline",
				after = "nvim-cmp",
			},
			{
				"hrsh7th/cmp-buffer",
				after = "nvim-cmp",
			},
			{
				"hrsh7th/cmp-path",
				after = "nvim-cmp",
			},
		},
		module = "cmp",
	})
	use({ "github/copilot.vim", event = "InsertCharPre" })

	use({
		"windwp/nvim-autopairs",
		event = "InsertCharPre",
		config = function()
			require("plugin.config.auto-pairs")
		end,
	})
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
	})

	-- Action menu
	use({
		"tami5/lspsaga.nvim",
		module = "lspsaga",
	})

	-- Lint
	use({
		"quick-lint/quick-lint-js",
		rtp = "plugin/vim/quick-lint-js.vim",
		tag = "1.0.0",
		opt = true,
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
		module = "indent_blankline",
	})

	-- Zen mode
	use({
		"folke/zen-mode.nvim",
		-- https://github.com/folke/twilight.nvim/issues/15
		requires = { { "folke/twilight.nvim", after = "zen-mode.nvim" } },
		otp = true,
		cmd = "ZenMode",
	})

	-- Better cursor move
	use("ggandor/lightspeed.nvim")

	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
		end,
		cmd = { "NvimTreeOpen", "NvimTreeFocus", "NvimTreeToggle" },
	})

	use({
		"sidebar-nvim/sidebar.nvim",
		config = function()
			require("plugin.config.sidebar")
		end,
		cmd = { "SidebarNvimToggle", "SidebarNvimOpen", "SidebarNvimUpdate", "SidebarNvimFocus" },
	})

	--Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		module = "gitsigns",
	})

	use({
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
	})

	use({
		"numToStr/Comment.nvim",
		keys = {
			"gc",
			"gcc",
		},
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		module = "todo-comments",
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
		module = "telescope",
		cmd = "Telescope",
	})

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		after = "telescope-fzf-native.nvim",
	})
	use({
		"nvim-telescope/telescope.nvim",
		after = "telescope-fzf-native.nvim",
	})

	-- Tree sitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		after = "impatient.nvim",
	})

	use({
		"p00f/nvim-ts-rainbow",
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

	-- Colab
	-- use 'jbyuki/instant.nvim'

	-- Cursor
	use({
		"yamatsum/nvim-cursorline",
		event = "BufWinEnter",
	})

	-- Scrollbar
	use({
		"dstein64/nvim-scrollview",
		after = "nvim-cursorline",
	})

	-- Show color code
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		cmd = "ColorizerToggle",
	})

	-- Which key
	use("folke/which-key.nvim")
	use({
		"kevinhwang91/nvim-hlslens",
		keys = "/",
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
