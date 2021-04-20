let bufferline = get(g:, 'bufferline', {})

let bufferline.animation = v:false

" autohide the tabline whene there is only one buffer
let bufferline.auto_hide = v:true

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

let bufferline.closable = v:false

let bufferline.semantic_letters = v:true

nnoremap <silent> ]t :BufferNext<CR>
nnoremap <silent> [t :BufferPrevious<CR>
nnoremap <silent> <leader>1 :BufferGoto 1<CR>
nnoremap <silent> <leader>2 :BufferGoto 2<CR>
nnoremap <silent> <leader>3 :BufferGoto 3<CR>
nnoremap <silent> <leader>4 :BufferGoto 4<CR>
nnoremap <silent> <leader>5 :BufferGoto 5<CR>
nnoremap <silent> <leader>6 :BufferGoto 6<CR>
nnoremap <silent> <leader>7 :BufferGoto 7<CR>
nnoremap <silent> <leader>8 :BufferGoto 8<CR>
nnoremap <silent> <leader>9 :BufferGoto 9<CR>

nnoremap <silent> <leader>0 :BufferCloseAllButCurrent<CR>
nnoremap <silent> <leader>b :BufferPick<CR>
