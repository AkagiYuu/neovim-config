local g = vim.g
local opt = vim.opt

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
opt.fillchars = "fold: "
vim.cmd([[
" UI
set termguicolors
set guicursor=
set mouse=a
" Opacity
set pumblend=15

set wrap!
set noswapfile
set nobackup
set shada = "NONE"
set nowritebackup
set cmdheight=1
set updatetime=300

" Line number
set number
set relativenumber
set signcolumn=number

" let &shell = 'pwsh'
" let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
" let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
" let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
" set shellquote= shellxquote=

set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

" https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=3
set foldminlines=1
set nofoldenable

set scrolloff=7
autocmd User LightspeedLeave set scrolloff=7

" Highlight

" Lsp
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

" Lspsaga
highlight LspFloatWinNormal guibg=NONE

" Rainbow brackets
hi rainbowcol1 guifg=LightBlue

highlight Todo gui=NONE

highlight NormalFloat guibg=NONE

highlight DashboardHeader guifg=LightBlue
]])
