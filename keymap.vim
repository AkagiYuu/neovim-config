" Copy to clipboard
vnoremap  <C-c>  "+y
nnoremap  <C-c>  "+yg_
nnoremap  <C-c>  "+y

" Naivigate between window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Nvim tree
nnoremap <F3>  :NvimTreeToggle<CR>


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <C-e>      <cmd>Telescope file_browser<cr>
nnoremap <leader>fe      <cmd>Telescope file_browser<cr>
nnoremap <leader>tc <cmd>Telescope colorscheme<cr>


" Buffer line
nnoremap <silent> <C-PageDown> :BufferLineCycleNext<CR>
nnoremap <silent> <C-PageUp> :BufferLineCyclePrev<CR>
nnoremap <silent> <C-T>         :BufferLinePick<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent> <A-Right> :BufferLineMoveNext<CR>
nnoremap <silent> <A-Left> :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent> be :BufferLineSortByExtension<CR>
nnoremap <silent> bd :BufferLineSortByDirectory<CR>
nnoremap <silent> <A-s> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" Lsp
nnoremap <silent> <C-F12>          :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>gw       :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <silent> <F12>            :lua vim.lsp.buf.definition()<CR>
" Lspsaga
nnoremap <silent> <leader>gh       :Lspsaga lsp_finder<CR>
nnoremap <silent> <F2>             :Lspsaga rename<cr>
nnoremap <silent> ca               <cmd>Lspsaga code_action<cr>
xnoremap <silent> ca               :<c-u>Lspsaga range_code_action<cr>
nnoremap <silent> K                :Lspsaga hover_doc<cr>
nnoremap <silent> <leader>gs       :Lspsaga signature_help<CR>
nnoremap <silent> <leader>pd       :Lspsaga preview_definition<CR>
nnoremap <silent> <leader>gd       :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e               :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e               :Lspsaga diagnostic_jump_prev<CR>
" autocmd CursorHold * lua require('lspsaga.hover').render_hover_doc()
" Snippets
imap <expr> <C-d>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <C-d>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <C-a> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <C-a> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Format
vnoremap <A-f> :lua vim.lsp.buf.range_formatting()<CR>
nnoremap <A-f> :lua vim.lsp.buf.formatting()<CR>
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | lua vim.lsp.buf.formatting_sync()
" augroup append(lnum, string)
