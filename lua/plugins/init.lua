local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print('Installing packer close and reopen Neovim...')
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float {
                border = 'single',
            }
        end,
    },
}

return packer.startup(function(use)
    use { 'lewis6991/impatient.nvim' }
    use { 'nathom/filetype.nvim' }

    --#region Library
    use { 'nvim-lua/plenary.nvim' }
    use { 'kevinhwang91/promise-async' }
    use { 'ii14/emmylua-nvim', opt = true }
    use {
        'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup {
                input = { winblend = 0 }
            }
        end,
        event = 'User Defer'
    }
    --#endregion

    use { 'wbthomason/packer.nvim' }

    use { 'catppuccin/nvim', as = 'catppuccin', run = ':CatppuccinCompile' }
    use { 'rebelot/kanagawa.nvim', module = 'kanagawa' }
    use { 'Shatur/neovim-ayu', opt = true }

    use {
        'declancm/cinnamon.nvim',
        config = function()
            require('cinnamon').setup {
                default_keymaps = true,
                extra_keymaps = true,
                extended_keymaps = true,
                hide_cursor = true,
                -- always_scroll = true,
                scroll_limit = 100,
            }
        end
    }

    use {
        'glepnir/dashboard-nvim',
        config = function() require('plugins.config.dashboard') end,
        opt = true
    }
    use {
        'nvim-neorg/neorg',
        ft = 'norg',
        after = 'nvim-treesitter',
        config = function() require('plugins.config.neorg') end,
        requires = 'nvim-lua/plenary.nvim'
    }

    use { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } }
    use { 'kyazdani42/nvim-web-devicons' }
    use {
        'rcarriga/nvim-notify',
        config = function() require('plugins.config.notify') end,
    }

    use {
        'rebelot/heirline.nvim',
        config = function() require('plugins.config.heirline') end,
    }

    use {
        'anuvyklack/hydra.nvim',
        config = function() require('plugins.config.hydra') end,
        event = 'User Defer'
    }
    use {
        'folke/which-key.nvim',
        config = function() require('plugins.config.whichkey') end,
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup {} end,
        event = 'User Defer'
    }

    use {
        'akinsho/bufferline.nvim',
        config = function() require('plugins.config.bufferline') end,
        event = { 'BufRead', 'BufNewFile' },
    }

    use {
        'ghillb/cybu.nvim',
        config = function() require('cybu').setup {} end,
        event = 'User Defer'
    }

    --#region Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugins.config.treesitter') end,
        event = { 'BufRead', 'BufNewFile' },
    }
    use {
        'ziontee113/syntax-tree-surfer',
        config = function() require('syntax-tree-surfer').setup {} end,
        after = 'nvim-treesitter'
    }
    use { 'nvim-treesitter/playground', opt = true }
    use { 'windwp/nvim-ts-autotag', event = 'InsertCharPre' }
    use {
        'm-demare/hlargs.nvim',
        config = function() require('hlargs').setup { use_colorpalette = true } end,
        after = 'nvim-treesitter'
    }
    use {
        'lewis6991/spellsitter.nvim',
        config = function() require('spellsitter').setup {} end,
        after = 'nvim-treesitter'
    }
    use {
        'zbirenbaum/neodim',
        config = function()
            require('neodim').setup {
                alpha = 0.75,
                update_in_insert = { enable = false, },
            }
        end,
        event = 'User Defer',
    }
    --#endregion

    --#region Lsp
    use {
        'neovim/nvim-lspconfig',
        config = function() require('plugins.config.lspconfig') end,
        event = { 'BufReadPre', 'BufNewFile' },
    }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require('plugins.config.null-ls') end,
        event = 'User Defer'
    }

    use {
        'glepnir/lspsaga.nvim',
        config = function() require('plugins.config.lspsaga') end,
        event = { 'BufRead', 'BufNewFile' },
    }
    --#endregion

    --#region cmp
    use {
        'hrsh7th/nvim-cmp',
        config = function() require('plugins.config.cmp') end,
        event = { 'BufRead', 'BufNewFile' },
    }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }

    use {
        'L3MON4D3/LuaSnip',
        requires = { { 'rafamadriz/friendly-snippets' } },
        config = function() require('plugins.config.luasnip') end,
        module = 'luasnip',
    }
    use { 'saadparwaiz1/cmp_luasnip', event = 'InsertCharPre' }
    use { 'tzachar/cmp-tabnine', run = './install.sh', event = 'InsertCharPre' }
    use { 'lukas-reineke/cmp-rg', event = 'InsertCharPre' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertCharPre' }
    use { 'hrsh7th/cmp-calc', event = 'InsertCharPre' }
    --#endregion

    --#region Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require('plugins.config.telescope') end,
        event = 'User Defer'
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        module = 'telescope._extensions.fzf',
    }

    use {
        'nvim-telescope/telescope-file-browser.nvim',
        module = 'telescope._extensions.file_browser',
    }
    --#endregion

    --#region Motion
    use {
        'ggandor/lightspeed.nvim',
        event = { 'BufRead', 'BufNewFile' },
    }

    use {
        'kylechui/nvim-surround',
        config = function() require('nvim-surround').setup {} end,
        event = 'User Defer'
    }
    --#endregion

    use {
        'nacro90/numb.nvim',
        config = function() require('numb').setup {} end,
        event = 'User Defer',
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require('plugins.config.auto-pairs') end,
        event = 'InsertCharPre',
    }

    use {
        'folke/trouble.nvim',
        config = function() require('trouble').setup {} end,
        cmd = { 'TroubleToggle', 'Trouble' },
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('plugins.config.indent') end,
        event = { 'BufRead', 'BufNewFile' },
    }
    use {
        'kevinhwang91/nvim-ufo',
        config = function() require('plugins.config.ufo')
        end,
        keys = { 'zM' },
    }

    use {
        'Pocco81/TrueZen.nvim',
        config = function()
            require('true-zen').setup {
                ui = { bottom = { laststatus = 3 } },
            }
        end,
        cmd = { 'TZAtaraxis', 'TZFocus', 'TZMinimalist' }
    }

    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require('plugins.config.nvim-tree') end,
        cmd = 'NvimTreeToggle',
    }

    use {
        'sidebar-nvim/sidebar.nvim',
        config = function() require('plugins.config.sidebar') end,
        cmd = 'SidebarNvimToggle',
    }

    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup {
                winbar = {
                    enabled = true,
                },
            }
        end,
        cmd = 'ToggleTerm',
    }

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup {} end,
        keys = { 'gc', 'gb' },
    }

    use {
        'sindrets/winshift.nvim',
        config = function() require('winshift').setup {} end,
        cmd = 'WinShift',
    }

    use {
        'saecki/crates.nvim',
        config = function() require('crates').setup {} end,
        event = { 'BufRead Cargo.toml' },
    }

    use {
        'Maan2003/lsp_lines.nvim',
        config = function() require('lsp_lines').setup() end,
        event = 'User Defer'
    }

    use {
        'monaqa/dial.nvim',
        config = function() require('plugins.config.dial') end,
        keys = { '<C-a>', '<C-x>' },
    }

    use {
        'ThePrimeagen/refactoring.nvim',
        config = function() require('refactoring').setup {} end,
        opt = true,
    }
    use { 'JASONews/glow-hover', opt = true }

    use {
        'potamides/pantran.nvim',
        config = function()
            require('pantran').setup { engines = { default_engine = 'google' } }
        end,
        cmd = 'Pantran'
    }

    use {
        'lewis6991/satellite.nvim',
        config = function()
            require('satellite').setup { winblend = 0, }
        end,
        event = { 'BufRead', 'BufNewFile' }
    }

    use {
        'NvChad/nvim-colorizer.lua',
        config = function() require 'colorizer'.setup() end,
        event = 'User Defer'
    }

    use { 'jakemason/ouroboros', ft = { 'c', 'cpp' } }

    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }

    use {
        'tamton-aquib/zone.nvim',
        config = function()
            require('zone').setup()
        end,
        cmd = 'Zone',
    }
end)
