" https://learnvimscriptthehardway.stevelosh.com/chapters/12.html
au BufEnter *.html setlocal wrap
au Filetype html setlocal nonu nornu spell spelllang=en_us
au Filetype html nnoremap <buffer> <localleader>c I<!-- <esc>A --><Esc>

" https://learnvimscriptthehardway.stevelosh.com/chapters/14.html
" the line below will add a new autocommand each time we source this file
" autocmd BufWrite * :echom "Writting buffer!"
" the proper way to do that is to clear the autocommand group first
augroup filetype_html
  autocmd!
  au BufWrite * :echom "Writting buffer!"
augroup END
