function! s:helpVertical()
  if &buftype == 'help'
    wincmd L
    nnoremap <buffer> q :q<CR>
  endif
endfunction

autocmd BufEnter *.txt call s:helpVertical()
