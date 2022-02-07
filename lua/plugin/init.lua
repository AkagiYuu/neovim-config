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
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- Plugin
return packer.startup(function(use)
	--Packer
	use("wbthomason/packer.nvim")

	--Improve load time
	use("nathom/filetype.nvim")
	use("lewis6991/impatient.nvim")

	--Zen mode
	use({
		"folke/zen-mode.nvim",
		--https://github.com/folke/twilight.nvim/issues/15
		requires = { { "folke/twilight.nvim" } },
	})

	--Better cursor move
	use("ggandor/lightspeed.nvim")

	--File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})

    use({
        'sidebar-nvim/sidebar.nvim',
        config = function () require('plugin.config.sidebar') end,
    })

	-- Icon
	use("kyazdani42/nvim-web-devicons")
	use("onsails/lspkind-nvim")
	--TODO : find way to use nonicons ({'yamatsum/nvim-nonicons'})

	--AI
	use("github/copilot.vim")

	use("nvim-lua/plenary.nvim")

	--Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		opt = true,
		config = function()
			require("gitsigns").setup()
		end,
		event = "BufRead",
		tag = "release", -- To use the latest release
	})

	--Terminal
	use({
        "akinsho/toggleterm.nvim",
        opt = true,
    })
	-- use({
	-- 	"s1n7ax/nvim-terminal",
	-- 	config = function()
	-- 		vim.o.hidden = true
	-- 		require("nvim-terminal").setup()
	-- 	end,
	-- })

	--Tab (buffer)
	use("akinsho/bufferline.nvim")

	--Comment

	--Toggle comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	--Todo Highlight
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
		event = "BufWinEnter",
	})

	--Document generate
	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				enabled = true,
			})
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	})

	--Lsp

	--Auto completion
	use({
		"neovim/nvim-lspconfig",
		requires = { "hrsh7th/cmp-nvim-lsp" },
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/vim-vsnip" },
            { "rafamadriz/friendly-snippets" },
			{ "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
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
	})
	
    --Format
	use("sbdchd/neoformat")

    --Lint
    use {'quick-lint/quick-lint-js', rtp = 'plugin/vim/quick-lint-js.vim', tag = '1.0.0', opt = true}
	--Action menu
	use({ "tami5/lspsaga.nvim" })

	--Diagnostic
	use({ "folke/lsp-colors.nvim" })
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	--Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("plugin.config.telescope")
		end,
		event = "BufWinEnter",
	})
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-symbols.nvim")

	--Tree sitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
        opt = true,
	})
    use({
        'p00f/nvim-ts-rainbow',
        after = 'nvim-treesitter',
    })

	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	--Colab
	--use 'jbyuki/instant.nvim'

	--UI

	--Theme
	-- use 'tribela/vim-transparent'
	use("rafamadriz/neon")
	use("projekt0n/github-nvim-theme")
    use({
	    "catppuccin/nvim",
	    as = "catppuccin"
    })
    use "rebelot/kanagawa.nvim"
    use 'marko-cerovac/material.nvim'

	--Cursor
	use("yamatsum/nvim-cursorline")

	--Scrollbar
	use("dstein64/nvim-scrollview")

	--Dash board
	use("glepnir/dashboard-nvim")

	--Status line
	use({
		"NTBBloodbath/galaxyline.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	--use('windwp/windline.nvim')

	--Notify
	use({
		"rcarriga/nvim-notify",
	})

	--Show color code
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	--Which key
	use({
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("plugin.config.whichkey")
		end,
	})

    use "lukas-reineke/indent-blankline.nvim"

    --Browser integration
    use {
       'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
