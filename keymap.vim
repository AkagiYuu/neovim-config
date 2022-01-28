" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" Naivigate between window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Nvim tree
nnoremap <F3>  :NvimTreeToggle<CR>


" Telescope
" Command-line
" nnoremap <leader> :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Find for > ")})<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <A-e>      <cmd>Telescope file_browser<cr>

" Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fx <cmd>lua require('finders').fd_in_nvim()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


" Buffer line
nnoremap <silent> <C-PageDown> :BufferLineCycleNext<CR>
nnoremap <silent> <C-PageUp> :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent> <A-Right> :BufferLineMoveNext<CR>
nnoremap <silent> <A-Left> :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent> be :BufferLineSortByExtension<CR>
nnoremap <silent> bd :BufferLineSortByDirectory<CR>
nnoremap <silent> <A-s> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>


" Lspsaga
nnoremap <silent> gh       :Lspsaga lsp_finder<CR>
nnoremap <silent> <F2>     <cmd>Lspsaga rename<cr>
nnoremap <silent> ca       <cmd>Lspsaga code_action<cr>
xnoremap <silent> ca       :<c-u>Lspsaga range_code_action<cr>
nnoremap <silent> K        <cmd>Lspsaga hover_doc<cr>
nnoremap <silent> gs       :Lspsaga signature_help<CR>
nnoremap <silent> gd       :Lspsaga preview_definition<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e       :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e       :Lspsaga diagnostic_jump_prev<CR>
" autocmd CursorHold,CursorHoldI * lua require('lspsaga.hover').render_hover_doc()


" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Format
vnoremap <leader>rf :lua vim.lsp.buf.range_formatting()<CR>
nnoremap <A-f>      :NeoF<CR>
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | lua vim.lsp.buf.formatting_sync()
" augroup append(lnum, string)
