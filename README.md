#

## Showcase

- Code completion
![CodeCompletion](screenshots/Completion.PNG)

- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua) as file tree
![NvimTree](screenshots/Nvimtree.PNG)

- 🔭 [Fuzzy finder](https://github.com/nvim-telescope/telescope.nvim)
![Telescope](screenshots/Telescope.PNG)

## Requirements

- [Neovim nightly](https://github.com/neovim/neovim/releases/tag/nightly)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

## Optional

- [Nonicons](https://github.com/AkagiYuu/nonicons) (for extra glyphs)
- [Language server protocol](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)

## Installation

- ***Backup your previous configuration***
- Clone the repository
  - Windows

  ```powershell
  git clone https://github.com/AkagiYuu/neovim-config ~/.config/nvim
  ```

  - Linux

  ```bash
  git clone https://github.com/AkagiYuu/neovim-config ~/.config/nvim
  ```

- Install packer.nvim (run `nvim` once and quit)
- Run `:PackerSync`
- Restart neovim

## Bonus

For windows terminal users, add the following line to settings.json for ctrl + space code completion:

```json
{
  "command": {
    "action": "sendInput",
    "input": "\u001b[32;5u"
  },
  "keys": "ctrl+space"
}
```

## Plugins

- [Packer](https://github.com/wbthomason/packer.nvim)
- [Filetype](https://github.com/nathom/filetype.nvim)
- [Impatient](https://github.com/lewis6991/impatient.nvim)
- Library
  - [Plenary](https://github.com/nvim-lua/plenary.nvim)
  - [Promise-Async](https://github.com/kevinhwang91/promise-async)

- Theme
  - [Catppuccin](https://github.com/catppuccin/nvim)
  - [Kanagawa](https://github.com/rebelot/kanagawa.nvim)

- [Git signs](https://github.com/lewis6991/gitsigns.nvim)
- [Heirline](https://github.com/rebelot/heirline.nvim)
- [Lightspeed](https://github.com/ggandor/lightspeed.nvim)
- [Notify](https://github.com/rcarriga/nvim-notify)
- [Hydra](https://github.com/anuvyklack/hydra.nvim)
- [Whichkey](https://github.com/folke/which-key.nvim)
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Cybu](https://github.com/ghillb/cybu.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - [ts-autotag](https://github.com/windwp/nvim-ts-autotag)
  - ...
- [Nvimtree](https://github.com/kyazdani42/nvim-tree.lua)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
  - [Fzf](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
  - [File browser](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [Sidebar](https://github.com/sidebar-nvim/sidebar.nvim)
- [Lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Lspsaga](https://github.com/tami5/lspsaga.nvim)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
  - [Luasnip](https://github.com/L3MON4D3/LuaSnip)
  - [Cmp-luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
  - [Friendly snippets](https://github.com/rafamadriz/friendly-snippets)
  - [Cmdline](https://github.com/hrsh7th/cmp-cmdline)
  - [Buffer](https://github.com/hrsh7th/cmp-buffer)
  - [Path](https://github.com/hrsh7th/cmp-path)
  - [Copilot](https://github.com/zbirenbaum/copilot-cmp)
  - ...
- [Comment](https://github.com/numToStr/Comment.nvim)
- [Terminal](https://github.com/akinsho/toggleterm.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)
- [Indent blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Cursorline](https://github.com/yamatsum/nvim-cursorline)
- [Zenmode](https://github.com/folke/zen-mode.nvim)
  - [Twilight](https://github.com/folke/twilight.nvim)
- [Startup time](https://github.com/dstein64/vim-startuptime)
- [hlargs.nvim](https://github.com/m-demare/hlargs.nvim)
- [focus.nvim](https://github.com/beauwilliams/focus.nvim)
- ...
