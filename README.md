#

## Features

- Fast startup time
  - Linux: ~61s (virtual machine with 2gb ram, 2 cores)
  ![Linux](./media/image/Linux%20Startup%20Time.PNG)
  - Windows: ~250s (4gb ram, 4 cores)
  ![Windows](./media/image/Windows%20Startup%20Time.PNG)

- LSP code completion
![CodeCompletion](/media/image/Completion.PNG)

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) based code highlighting
![Treesitter](./media/image/Treesitter.PNG)

- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua) as file tree
![NvimTree](./media/image/Nvimtree.PNG)

- 🔭 [Fuzzy finder](https://github.com/nvim-telescope/telescope.nvim)
![Telescope](./media/image/Telescope.PNG)

- [Sidebar](https://github.com/sidebar-nvim/sidebar.nvim)
![Sidebar](/media/image/Sidebar.PNG)

- [Whichkey](https://github.com/folke/which-key.nvim)
![Wichkey](./media/image/Whichkey.PNG)

## Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Neovim 0.6+](https://github.com/neovim/neovim/releases/tag/v0.6.1)
- [Node.js](https://nodejs.org)
- [Lua language server](https://github.com/sumneko/lua-language-server)

## Optional

- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [Language server protocol](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

## Installation

***Please backup any existing configuration files***

### Clone the repository

#### Linux

```text
git clone https://github.com/AkagiYuu/neovim-config ~/.config/nvim
nvim +PackerSync
```

#### Windows

```text
git clone https://github.com/AkagiYuu/neovim-config ~/AppData/Local/nvim
nvim +PackerSync
```

## Plugins

- [Packer](https://github.com/wbthomason/packer.nvim)
- [Impatient](https://github.com/lewis6991/impatient.nvim)
- [Plenary](https://github.com/nvim-lua/plenary.nvim)
- [Feline](https://github.com/feline-nvim/feline.nvim)
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- [Lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [Lightspeed](https://github.com/ggandor/lightspeed.nvim)
- [Whichkey](https://github.com/folke/which-key.nvim)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- ...
