local g = vim.g
local opt = vim.opt
local OS = vim.loop.os_uname().version

g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1

g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

opt.termguicolors = true
opt.guicursor = ''
opt.mouse = 'a'
opt.pumblend = 15 -- Opacity

opt.wrap = false
if OS:match 'Windows' then
    opt.directory = 'E:/nvim/swap//'
    opt.undofile = true
    opt.undodir = 'E:/nvim/undo//'
end
opt.shada = ''
opt.cmdheight = 1
opt.updatetime = 300

opt.showmode = false

opt.number = true
opt.relativenumber = true
opt.signcolumn = 'number'

opt.smarttab = true
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
opt.foldnestmax = 3
opt.foldminlines = 1
opt.foldenable = false

opt.scrolloff = 7
vim.cmd([[
    autocmd User LightspeedLeave set scrolloff=7

    " highlight LspFloatWinNormal guibg=NONE

    hi rainbowcol1 guifg=LightBlue

    highlight Todo gui=NONE

    highlight NormalFloat guibg=NONE
]])
