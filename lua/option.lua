local opt = vim.opt

opt.termguicolors = true
opt.guicursor = ""
opt.mouse = "a"
-- opt.pumblend = 15 -- Opacity
opt.laststatus = 3
opt.fillchars= opt.fillchars + [[eob:\]]

opt.wrap = false
opt.undofile = true
opt.shada = ""
opt.updatetime = 300

opt.showmode = false

opt.number = true
opt.relativenumber = true
opt.signcolumn = "number"

opt.softtabstop = 4
opt.cindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
opt.fillchars = "fold: "
opt.foldenable = false

opt.scrolloff = 7
