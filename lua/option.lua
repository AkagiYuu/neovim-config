local opt = vim.opt
_G.config = {}

opt.termguicolors = true
opt.guicursor = ""
opt.mouse = "a"
opt.laststatus = 3

opt.wrap = false
opt.undofile = true
opt.shada = ""
opt.updatetime = 200

opt.showmode = false

opt.number = true
opt.signcolumn = "number"

opt.softtabstop = 4
opt.cindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.fillchars = "fold: ,eob: "
--
-- https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = [[substitute(getline(v:foldstart),'\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
opt.foldenable = false

opt.scrolloff = 7
