xnoremap $          g_

" Horizontal Scroll
nnoremap <C-Left>   20zh
nnoremap <C-Right>  20zl

" Fix search highlighting in the current buffer.
nnoremap i          :noh<cr>i

" Copy to clipboard
vnoremap <C-c>      "+y
nnoremap <C-c>      "+yg_
nnoremap <C-c>      "+y

" Naivigate between window
nnoremap <C-h>      <C-w>h
nnoremap <C-j>      <C-w>j
nnoremap <C-k>      <C-w>k
nnoremap <C-l>      <C-w>l

" Nvim tree
nnoremap <F3>                   :NvimTreeToggle<CR>

" Terminal
nnoremap <C-\>                  :ToggleTerm<CR>
inoremap <C-\>                  :ToggleTerm<CR>

" Telescope
nnoremap <leader>ff             :Telescope find_files<cr>
nnoremap <C-f>                  :lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>
nnoremap <leader>fg             :Telescope live_grep<cr>
nnoremap <leader>fb             :Telescope buffers<cr>
nnoremap <leader>fh             :Telescope help_tags<cr>
nnoremap <C-e>                  :Telescope file_browser<cr>
nnoremap <leader>fe             :Telescope file_browser<cr>
nnoremap <leader>tc             :Telescope colorscheme<cr>


" Buffer line
nnoremap <silent> <C-PageDown>  :BufferLineCycleNext<CR>
nnoremap <silent> <C-PageUp>    :BufferLineCyclePrev<CR>
nnoremap <silent> <C-T>         :BufferLinePick<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent> <A-Right>     :BufferLineMoveNext<CR>
nnoremap <silent> <A-Left>      :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent> be            :BufferLineSortByExtension<CR>
nnoremap <silent> bd            :BufferLineSortByDirectory<CR>

" Lsp
nnoremap <silent> <C-F12>       :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>gw    :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <silent> <F12>         :lua vim.lsp.buf.definition()<CR>
" Lspsaga
nnoremap <silent> <leader>gh    :Lspsaga lsp_finder<CR>
nnoremap <silent> <F2>          :Lspsaga rename<cr>
nnoremap <silent> ca            :Lspsaga code_action<cr>
xnoremap <silent> ca            :<c-u>Lspsaga range_code_action<cr>
nnoremap <silent> K             :Lspsaga hover_doc<cr>
nnoremap <silent> <leader>gs    :Lspsaga signature_help<CR>
nnoremap <silent> <leader>pd    :Lspsaga preview_definition<CR>
nnoremap <silent> <leader>gd    :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e            :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e            :Lspsaga diagnostic_jump_prev<CR>
" autocmd CursorHold * lua require('lspsaga.hover').render_hover_doc()
" Snippets
imap <expr> <Tab>               vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>               vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab>               vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab>               vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


" Trouble
nnoremap <leader>xx             :TroubleToggle<cr>
nnoremap <leader>xw             :TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd             :TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq             :TroubleToggle quickfix<cr>
nnoremap <leader>xl             :TroubleToggle loclist<cr>
nnoremap gR                     :TroubleToggle lsp_references<cr>

" Format
vnoremap <A-f>                  :lua vim.lsp.buf.range_formatting()<CR>
nnoremap <A-f>                  :lua vim.lsp.buf.formatting()<CR>
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | lua vim.lsp.buf.formatting_sync()
" augroup append(lnum, string)

" Moving line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
