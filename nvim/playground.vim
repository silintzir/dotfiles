" https://learnvimscriptthehardway.stevelosh.com/chapters/12.html
au BufEnter *.html setlocal wrap
au Filetype html setlocal nonu nornu spell spelllang=en_us
au Filetype html nnoremap <buffer> <localleader>c I<!-- <esc>A --><Esc>

" https://learnvimscriptthehardway.stevelosh.com/chapters/14.html
" the line below will add a new autocommand each time we source this file
" autocmd bufwrite * :echom "writting buffer!"
" the proper way to do that is to clear the autocommand group first
augroup filetype_html
  autocmd!
  au BufWrite * :echom "Writting buffer!"
augroup END

" operator pending mode mappings
" https://learnvimscriptthehardway.stevelosh.com/chapters/15.html
onoremap <silent> ie :<C-u>normal! gg0vG<CR>

" https://learnvimscriptthehardway.stevelosh.com/chapters/16.html


" https://learnvimscriptthehardway.stevelosh.com/chapters/19.html
" let shortmess="somevalue"
" echo shortmess -- will print the variable name 
" echo &shortmess -- will print the option name if exists
" let &rnu=1 -- is the same as set rnu 
" let &l:rnu=1 -- is the same as setlocal rnu
" let @a = 1 -- sets a register
" echo @a 
" echo @/ -- will echo the last search since register / is used for searches
" echo @" -- will echo the last text yanked


function Meow()
  :echo "Hello"
endfunction

