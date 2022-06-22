local opt = vim.opt
_G.config = {}

opt.termguicolors = true
opt.guicursor = ""
opt.mouse = "a"
opt.laststatus = 3
opt.cmdheight = 0

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
opt.fillchars = {
    vert = "▕",
    fold = " ",
    eob = " ",
    diff = "─",
    msgsep = "‾",
    foldopen = "▾",
    foldclose = "▸",
    foldsep = " ",
}
opt.foldenable = false
opt.foldlevel = 99

opt.scrolloff = 7
