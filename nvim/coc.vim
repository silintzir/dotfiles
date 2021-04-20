function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" mappings 
nnoremap <silent>         K               :call <SID>show_documentation()<CR>
inoremap <silent><expr>   <c-space>       coc#refresh()
inoremap <silent><expr>   <TAB>           pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr>           <S-TAB>         pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr>   <cr>            pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent>             [g              <Plug>(coc-diagnostic-prev)
nmap <silent>             ]g              <Plug>(coc-diagnostic-next)
nmap <silent>             <leader>gd      <Plug>(coc-definition)
nmap <silent>             <leader>gr      <Plug>(coc-references)
nmap <silent>             <leader>gi      <Plug>(coc-implementation)
nmap                      <leader>rn      <Plug>(coc-rename)
nmap                      <leader>fip     :CocSearch <C-r>=expand("<cword>")<CR><CR>
nmap                      <leader>sym     :CocList symbols<CR>
nmap                      <leader>mcol    :call CocAction('pickColor')<CR>

nmap <silent>             <C-t>           :CocCommand explorer --preset sources<CR>
nmap <silent>             <leader>eb      :CocCommand explorer --preset buffers<CR>
nmap <silent>             <leader>ed      :CocCommand explorer --preset .vim<CR>
nmap <silent>             <leader>ee      :CocList mru<CR>

nmap <silent>             <leader>ac      <Plug>(coc-codeaction)

