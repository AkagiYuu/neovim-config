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

return packer.startup(function(use)
	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")
	use("nvim-lua/plenary.nvim")

	use("wbthomason/packer.nvim")

	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "dstein64/vim-startuptime", cmd = { "StartupTime" } })

	use({
		"kyazdani42/nvim-web-devicons",
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"rebelot/heirline.nvim",
		config = function()
			require("plugins.config.heirline")
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.config.bufferline")
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			require("plugins.config.notify")
		end,
		event = { "BufRead", "BufNewFile" },
	})
	use({
		"nacro90/numb.nvim",
		config = function()
			require("plugins.config.numb")
		end,
		keys = ":",
	})

	use({
		"ghillb/cybu.nvim",
		config = function()
			require("plugins.config.cybu")
		end,
		cmd = { "CybuNext", "CybuPre" },
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lspconfig")
		end,
		event = { "BufReadPre", "BufNewFile" },
	})

	use({
		"folke/lua-dev.nvim",
		module = "lua-dev",
	})
	-- use({
	-- 	"j-hui/fidget.nvim",
	-- 	config = function()
	-- 		require("plugins.config.fidget")
	-- 	end,
	-- 	-- event = { "BufRead", "BufNewFile" },
	-- 	opt = true
	-- })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.null-ls")
		end,
		after = "nvim-lspconfig",
	})

	use({
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-lspconfig",
	})
	use({
		"L3MON4D3/LuaSnip",
		requires = {
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			require("plugins.config.luasnip")
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"saadparwaiz1/cmp_luasnip",
		module = "luasnip",
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-cmdline", event = { "BufRead", "BufNewFile" } },
			{ "hrsh7th/cmp-buffer", event = { "BufRead", "BufNewFile" } },
			{ "hrsh7th/cmp-path", event = { "BufRead", "BufNewFile" } }
		},
		config = function()
			require("plugins.config.cmp")
		end,
		event = { "BufRead", "BufNewFile" },
	})
	use({
		"lukas-reineke/cmp-rg",
		event = "InsertCharPre",
	})
	use({
		"hrsh7th/cmp-nvim-lsp-signature-help",
		event = "InsertCharPre",
	})
	use({
		"hrsh7th/cmp-calc",
		event = "InsertCharPre",
	})
	use({
		"tzachar/cmp-tabnine",
		run = "powershell ./install.ps1",
		config = function()
			require("plugins.config.tabnine")
		end,
		event = "InsertCharPre",
	})

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
		event = { "BufRead", "BufNewFile" },
	})
	use({
		"m-demare/hlargs.nvim",
		event = { "BufRead", "BufNewFile" },
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
			require("plugins.config.lspsaga")
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
		cmd = "NvimTreeToggle",
	})

	use({
		"sidebar-nvim/sidebar.nvim",
		config = function()
			require("plugins.config.sidebar")
		end,
		cmd = "SidebarNvimToggle",
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
		config = function()
			require("toggleterm").setup()
		end,
		cmd = "ToggleTerm",
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		keys = {
			"gc",
			"gb",
		},
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		event = { "BufRead", "BufNewFile" },
		cmd = "Telescope",
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

	use({
		"beauwilliams/focus.nvim",
		config = function()
			require("plugins.config.focus")
		end,
		event = { "BufRead", "BufNewFile" },
	})

	use({
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("plugins.config.crates")
		end,
	})

	use({
		'kevinhwang91/nvim-ufo',
		requires = 'kevinhwang91/promise-async',
		config = function()
			require("plugins.config.ufo")
		end,
		event = { "BufRead", "BufNewFile" },
	})
end)
