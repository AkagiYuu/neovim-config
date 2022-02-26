require("impatient")

require("plugin")

require("theme")

require("plugin.config.notify")

require("plugin.config.treesitter")
require("plugin.config.lspconfig")
require("plugin.config.null-ls")

require("plugin.config.icon")

require('mapping')

-- Options
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
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set path+=**
set wildmode=list:longest,full

" Line number
set number
set relativenumber
set signcolumn=number

let &shell = 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=

set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

" https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
set fillchars=fold:\
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

set spelllang=en
highlight SpellBad gui=NONE
nnoremap <silent> <leader>s :set spell!<cr>

set scrolloff=7
autocmd User LightspeedLeave set scrolloff=7

" Firen
" if exists('g:started_by_firenvim')
"     autocmd BufEnter * :set lines=25
"     autocmd BufEnter colab.*.txt set filetype=python
" endif


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
