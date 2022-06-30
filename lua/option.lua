local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.theme = "catppuccin"

opt.termguicolors = true
opt.guicursor = ""
opt.mouse = "a"
opt.laststatus = 3
opt.cmdheight = 0
opt.shada = ""
opt.wrap = false
opt.undofile = true
opt.updatetime = 100
opt.timeoutlen = 250
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
opt.foldlevel = 99
opt.clipboard = "unnamedplus"
opt.scrolloff = 8

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	signs = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
