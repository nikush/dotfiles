" syntax settings
"let php_sql_query=1
"let php_htmlInStrings=1
"let php_folding=1

" streamline testing
nnoremap <leader>t :!phpunit<cr>
" test current file
nnoremap <leader>tc :!phpunit %<cr>

" highlight 80 and 120 char margins
set colorcolumn=+1,+41
