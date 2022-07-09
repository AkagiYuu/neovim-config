local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.theme = 'catppuccin'
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
opt.laststatus = 3
opt.cmdheight = 0
opt.shada = ''
opt.wrap = false
opt.undofile = true
opt.updatetime = 100
opt.timeoutlen = 250
opt.showmode = false
opt.number = true
opt.signcolumn = 'number'
opt.softtabstop = 4
opt.cindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.fillchars = {
    vert = '▕',
    fold = ' ',
    eob = ' ',
    diff = '─',
    msgsep = '‾',
    foldopen = '',
    foldclose = '',
    foldsep = ' ',
}
opt.foldlevel = 99
opt.clipboard = 'unnamedplus'
opt.scrolloff = 8

vim.diagnostic.config {
    virtual_text = true,
    virtual_lines = false,
    signs = true,
}

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
