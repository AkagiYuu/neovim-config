local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print("Installing packer close and reopen Neovim...")
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "single",
            }
        end,
    },
}

return packer.startup(function(use)
    use { "lewis6991/impatient.nvim" }
    use { "nathom/filetype.nvim" }

    use { "nvim-lua/plenary.nvim" }
    use { "kevinhwang91/promise-async" }

    use { "wbthomason/packer.nvim" }

    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rebelot/kanagawa.nvim" }

    use { "dstein64/vim-startuptime", cmd = { "StartupTime" } }
    use { "kyazdani42/nvim-web-devicons" }
    use {
        "yamatsum/nvim-nonicons",
        branch = "feat/lua",
        config = function()
            require("nvim-nonicons").setup {}
        end
    }

    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {}
        end,
        event = { "BufRead", "BufNewFile" },
    }

    use {
        "rebelot/heirline.nvim",
        config = function()
            require("plugins.config.heirline")
        end,
    }
    use {
        "ggandor/lightspeed.nvim",
        event = { "BufRead", "BufNewFile" },
    }
    use {
        "rcarriga/nvim-notify",
        config = function()
            require("plugins.config.notify")
        end,
        event = { "BufRead", "BufNewFile" }
    }

    use {
        "anuvyklack/hydra.nvim",
        config = function()
            require("plugins.config.hydra")
        end,
        event = { "BufRead", "BufNewFile" }
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("plugins.config.whichkey")
        end,
        event = { "BufRead", "BufNewFile" },
    }

    use {
        "akinsho/bufferline.nvim",
        config = function()
            require("plugins.config.bufferline")
        end,
        event = { "BufRead", "BufNewFile" },
    }

    use {
        "ghillb/cybu.nvim",
        config = function()
            require("cybu").setup {}
        end,
        cmd = { "CybuNext", "CybuPre" },
    }

    --#region Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter")
        end,
        event = { "BufRead", "BufNewFile" },
    }
    use { "windwp/nvim-ts-autotag", event = { "BufRead", "BufNewFile" } }
    use {
        "m-demare/hlargs.nvim",
        config = function()
            require("hlargs").setup {}
        end,
        event = { "BufRead", "BufNewFile" },
    }
    use {
        'lewis6991/spellsitter.nvim',
        config = function()
            require("spellsitter").setup {}
        end,
        event = { "BufRead", "BufNewFile" },
    }
    --#endregion

    --#region Lsp
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.config.lspconfig")
        end,
        event = { "BufReadPre", "BufNewFile" },
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugins.config.null-ls")
        end,
        event = { "BufReadPre", "BufNewFile" },
    }

    use {
        "glepnir/lspsaga.nvim",
        config = function()
            require("plugins.config.lspsaga")
        end,
        event = { "BufRead", "BufNewFile" },
    }
    --#endregion

    --#region cmp
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.config.cmp")
        end,
        event = { "BufRead", "BufNewFile" }
    }
    use { "hrsh7th/cmp-nvim-lsp", event = { "BufReadPre", "BufNewFile" } }
    use { "hrsh7th/cmp-cmdline", event = { "BufRead", "BufNewFile" } }
    use { "hrsh7th/cmp-buffer", event = { "BufRead", "BufNewFile" } }
    use { "hrsh7th/cmp-path", event = { "BufRead", "BufNewFile" } }

    use {
        "L3MON4D3/LuaSnip",
        requires = {
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            require("plugins.config.luasnip")
        end,
        event = { "BufRead", "BufNewFile" },
    }
    use { "saadparwaiz1/cmp_luasnip", event = "InsertCharPre" }
    use { 'tzachar/cmp-tabnine', run = './install.sh', event = "InsertCharPre" }
    use { "lukas-reineke/cmp-rg", event = "InsertCharPre" }
    use { "hrsh7th/cmp-nvim-lsp-signature-help", event = "InsertCharPre" }
    use { "hrsh7th/cmp-calc", event = "InsertCharPre" }
    --#endregion

    --#region Telescope
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        event = { "BufRead", "BufNewFile" },
        cmd = "Telescope",
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        after = "telescope-fzf-native.nvim"
    }
    use {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.config.telescope")
        end,
        after = "telescope-fzf-native.nvim"
    }
    --#endregion

    use {
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup {}
        end,
        keys = ":",
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.config.auto-pairs")
        end,
        event = "InsertCharPre",
    }

    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {}
        end,
        cmd = { "TroubleToggle", "Trouble" },
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.config.indent")
        end,
        event = { "BufRead", "BufNewFile" },
    }
    use {
        'kevinhwang91/nvim-ufo',
        config = function()
            require("plugins.config.ufo")
        end,
        keys = {
            "zc",
            "zM"
        }
    }

    use {
        "yamatsum/nvim-cursorline",
        event = { "BufRead", "BufNewFile" },
    }

    use {
        "folke/zen-mode.nvim",
        requires = { { "folke/twilight.nvim", after = "zen-mode.nvim" } },
        cmd = "ZenMode",
    }

    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("plugins.config.nvim-tree")
        end,
        cmd = "NvimTreeToggle",
    }

    use {
        "sidebar-nvim/sidebar.nvim",
        config = function()
            require("plugins.config.sidebar")
        end,
        cmd = "SidebarNvimToggle",
    }

    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup {}
        end,
        cmd = "ToggleTerm",
    }

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup {}
        end,
        keys = {
            "gc",
            "gb",
        },
    }


    use {
        "beauwilliams/focus.nvim",
        config = function()
            require("focus").setup {}
        end,
        event = { "BufRead", "BufNewFile" },
    }
    use {
        'sindrets/winshift.nvim',
        config = function()
            require("winshift").setup {}
        end,
        cmd = "WinShift"
    }

    use {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup {}
        end,
    }


    use {
        "Maan2003/lsp_lines.nvim",
        config = function()
            require("lsp_lines").register_lsp_virtual_lines()
        end,
        event = { "BufRead", "BufNewFile" },
    }

    use {
        "monaqa/dial.nvim",
        config = function()
            require("plugins.config.dial")
        end,
        keys = {
            "<C-a>",
            "<C-d>",
        },
    }
end)
