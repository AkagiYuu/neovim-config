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
		"rafamadriz/neon",
		opt = true,
	})
	use({
		"rebelot/kanagawa.nvim",
	})

	-- Icon
	use("kyazdani42/nvim-web-devicons")
	use("onsails/lspkind-nvim")

	use({
		"NTBBloodbath/galaxyline.nvim",
		after = "nvim-web-devicons",
		config = function()
			require("plugin.config.galaxy-line")
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		after = "nvim-web-devicons",
		config = function()
			require("plugin.config.bufferline")
		end,
	})

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	use({ "rcarriga/nvim-notify" })

	-- Lsp
	use({
		"neovim/nvim-lspconfig",
		requires = { "hrsh7th/cmp-nvim-lsp" },
	})
	use("jose-elias-alvarez/null-ls.nvim")

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
			{ "hrsh7th/vim-vsnip" },
			{ "rafamadriz/friendly-snippets" },
			{
				"hrsh7th/cmp-vsnip",
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
			{
				"windwp/nvim-autopairs",
				after = "nvim-cmp",
				config = function()
					require("plugin.config.auto-pairs")
				end,
			},
		},
		config = function()
			require("plugin.config.nvim-cmp")
		end,
		event = "BufWinEnter",
	})
    use({"github/copilot.vim", after = 'nvim-cmp'})

	-- Action menu
	use({
		"tami5/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				code_action_prompt = {
					enable = true,
					sign = true,
					sign_priority = 40,
					virtual_text = false,
				},
			})
			require("plugin.config.lspsaga_config")
		end,
		after = "nvim-cmp",
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
		otp = true,
		cmd = { "TroubleToggle", "Trouble", "TroubleRefresh" },
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugin.config.indent")
		end,
		event = "BufRead",
	})

	-- Zen mode
	use({
		"folke/zen-mode.nvim",
		-- https://github.com/folke/twilight.nvim/issues/15
		requires = { { "folke/twilight.nvim" } },
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
		opt = true,
		cmd = { "NvimTreeOpen", "NvimTreeFocus", "NvimTreeToggle" },
	})

	use({
		"sidebar-nvim/sidebar.nvim",
		config = function()
			require("plugin.config.sidebar")
		end,
		otp = true,
		cmd = { "SidebarNvimToggle", "SidebarNvimOpen", "SidebarNvimUpdate", "SidebarNvimFocus" },
	})

	-- Git
	-- use({
	-- 	'lewis6991/gitsigns.nvim',
	-- 	requires = {
	-- 		'nvim-lua/plenary.nvim',
	-- 	},
	-- 	opt = true,
	-- 	config = function()
	-- 		require('gitsigns').setup()
	-- 	end,
	-- 	event = 'BufWinEnter',
	-- 	tag = 'release', -- To use the latest release
	-- })

	use("akinsho/toggleterm.nvim")

	use({
		"numToStr/Comment.nvim",
		keys = { "gcc" },
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
		event = "ColorScheme",
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
		"nvim-telescope/telescope.nvim",
		requires = {},
		config = function()
			require("plugin.config.telescope")
		end,
		cmd = "Telescope",
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		after = "telescope.nvim",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	})

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		after = "telescope.nvim",
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	})

	-- Tree sitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"p00f/nvim-ts-rainbow",
		after = "nvim-treesitter",
	})

	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	use({
		"ThePrimeagen/refactoring.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-treesitter/nvim-treesitter" } },
		config = function()
			require("refactoring").setup({})
		end,
		event = "BufWinEnter",
	})

	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- Colab
	-- use 'jbyuki/instant.nvim'

	-- Cursor
	use("yamatsum/nvim-cursorline")

	-- Scrollbar
	use("dstein64/nvim-scrollview")

	-- Show color code
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		event = "ColorScheme",
	})

	-- Which key
	use({
		"folke/which-key.nvim",
		event = "BufWinEnter",
		config = function()
			require("which-key").setup({
				popup_mappings = {
					scroll_down = "<Down>", -- binding to scroll down inside the popup
					scroll_up = "<Up>", -- binding to scroll up inside the popup
				},
			})
		end,
	})
	use("kevinhwang91/nvim-hlslens")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
