"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Plug 'takac/vim-hardtime'
Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/is.vim'
Plug 'preservim/tagbar'
Plug 'bronson/vim-visual-star-search'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
call plug#end()

"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Set commands and settings
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" set exrc
set background=dark
set guifont=UbuntuMono\ Nerd\ Font\ 14
set cursorline
set cmdheight=2
set scrolloff=8
set formatoptions-=cro
" buffer related and history
set autoread
set hidden
set noswapfile
set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undodir
" indents tabs, and spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
set expandtab
set smarttab
set smartindent

set termguicolors
set incsearch
set nohlsearch
set showmode
set splitbelow
set splitright
set noerrorbells
set visualbell
set nolist
set mouse=a
set ignorecase
set smartcase
set shortmess+=c
set number
set relativenumber
set colorcolumn=120
set signcolumn=yes
set ruler
set completeopt=menuone,noinsert,noselect
set updatetime=300

"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Mappings & Keyboard shortcuts
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" toggle relative numbers
noremap <F2> :set invrelativenumber<cr>
" toggle highlighting of search
noremap <F3> :set hlsearch!<cr>
" toggle git gutter
noremap <F4> :GitGutterToggle<cr>
noremap <F5> :Startify<cr>
noremap <F6> :TagbarToggle<cr>
" edit the vimrc
noremap <F11> :vsp $MYVIMRC<cr>
" reload the configuration with F12
noremap <F12> :source $MYVIMRC<cr>
" leader key
let mapleader = " "
" escape with jk/kj
inoremap jk <esc>
inoremap kj <esc>
" prevent x and X from overriding the clipboard
nnoremap x "_x
nnoremap X "_x
" shift y to copy from the cursor till the end of the line
nnoremap Y y$
" keep cursor at the bottom of the visual selection after yanking
xnoremap y ygv<esc>
" prevent selecting and pasting from overwriting what was originally copied
xnoremap p pgvy
" clear search highlights with double space
map <leader><space> :let @/=''<cr>
" insert empty lines above the current line
noremap <C-o> O<Esc>
" navigate in buffers while in window with up and oown arrows
nnoremap <Up> :bn<cr>
nnoremap <Down> :bp<cr>
" navigate in windows with left and right arrow
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l
" open a new tab
nnoremap <C-t> :tabnew<cr>
" open netrw
nnoremap <C-n> :Vexplore<cr>
" navigate through tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
" copen
nnoremap <leader>' :copen<cr>
" terminal
nnoremap <leader>; :vsp<cr>:terminal<cr>i
tnoremap <C-d>  <C-\><C-n>
" Press * to search for the term under the cursor or a visual selection and
" then press the key below to replace all instances of it in the current files
nnoremap <leader>r :%s///gI<Left><Left><Left>
nnoremap <leader>rc :%s///gIc<Left><Left><Left><Left>
" The same as above but instead of acting on the whole file it will
" be restricted to the previously visually selected range. You can do that
" by pressing *, visually selecting the range you want it to apply and then
" press a key below to replace all instances of it in the current selection
xnoremap <leader>r :s///gI<Left><Left><Left>
xnoremap <leader>rc :s///gIc<Left><Left><Left><Left>
" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" coc related mappings

" use <c-space> to trigger completion
inoremap  <silent><expr> <c-space> coc#refresh()

" rename (coc-rename)
nmap <leader>pr <Plug>(coc-rename)
nmap <leader>prw :CocSearch <C-r>=expand("<cword>")<cr><cr>

" use [g  and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)



"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Auto commands
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Auto resize splits on vim resize
autocmd VimResized * wincmd=

" Update a buffer's contents on focus if changed outside vim
autocmd FocusGained,BufEnter * :checktime

" Unset  paste on insert leave
autocmd InsertLeave * silent! set nopaste

" cursor line only on active buffer
augroup CursorLine
	autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" visual guides and line numbers
fun! TurnOnGuides()
  set relativenumber
  set number
  set signcolumn=yes
  set colorcolumn=120
endfun
fun! TurnOffGuides()
  set norelativenumber
  set nonumber
  set signcolumn=no
  set colorcolumn=800
endfun
nnoremap <leader>ao :call TurnOnGuides()<cr>
nnoremap <leader>ae :call TurnOffGuides()<cr>
augroup VisualGuides
  autocmd!
  autocmd FileType *\(^\(startify\|netrw\|help\)\)\@<! :call TurnOnGuides()
  autocmd FileType netrw,help :call TurnOffGuides()
augroup END

" trim trailing white space and empty lines
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
augroup Trimmer
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

" correct comment highlighting in json files
augroup JsonToJsonc
  autocmd!
  autocmd! FileType json set filetype=jsonc
augroup end

" coc highlight
augroup CocHighlight
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Plugins configuration
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" gruvbox - colorschem
colorscheme gruvbox
highlight Normal guibg=none
let g:gruvbox_invert_selection='0'
let g:gruvbox_italic='1'
let g:gruvbox_improved_strings='0'
let g:gruvbox_italicize_strings='0'
let g:gruvbox_transparent_bg='0'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
highlight ColorColumn ctermbg=0 guibg=grey
highlight LineNr guifg=#5eacd3
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

" netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_localrmdir = 'rm -r'

" jiangmiao/auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutJump = '<M-n>'
let g:AutoPairsShortcutToggle = '<leader>ap'
let g:AutoPairsShortcutFastWrap = '<M-e>'

" matze/vim-move
let g:move_key_modifier = 'C'

" nvim-telescope/telescope.nvim
lua require('mystuff')
nnoremap <C-g> :lua require('mystuff.telescope').grep_this_string()<cr>
nnoremap <c-p> :lua require('mystuff.telescope').find_files()<cr>
nnoremap <leader>ll :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>gg :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<cr>

nnoremap <leader>rg :lua require('telescope.builtin').registers()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>bf :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ht :lua require('telescope.builtin').help_tags()<cr>
" my stuff
nnoremap <leader>gb :lua require('mystuff.telescope').git_branches()<cr>
nnoremap <leader>sdf :lua require('mystuff.telescope').search_dotfiles()<cr>

" treesitter
lua require'nvim-treesitter.configs'.setup {
  \ highlight = { enable = true },
  \ indent = { enable = true }
  \ }

" mhinz/startify
let g:startify_files_number = 10
let g:startify_lists = [
      \ { 'type': 'sessions', 'header': ['   Saved sessions'] },
      \ { 'type': 'dir', 'header': ['   MRU '.getcwd()] },
      \ { 'type': 'files', 'header': ['   MRU'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] }
      \ ]
let g:startify_bookmarks = [
      \   {'a': '~/dotfiles/alacritty.yml'},
      \   {'c': '~/dotfiles/init.vim'} ,
      \   {'i': '~/dotfiles/install'},
      \   {'l': '~/dotfiles/lua/mystuff/telescope.lua'},
      \   {'s': '~/dotfiles/SHORTCUTS.md'},
      \   {'t': '~/dotfiles/tmux.conf'},
      \   {'z': '~/dotfiles/zshrc'},
      \ ]
let g:startify_enable_special = 0
let g:startify_fortune_use_unicode = 1
let g:startify_skiplist = [
      \  '~/dotfiles/alacritty.yml',
      \  '~/dotfiles/init.vim' ,
      \  '~/dotfiles/install',
      \  '~/dotfiles/lua/mystuff/telescope.lua',
      \  '~/dotfiles/SHORTCUTS.md',
      \  '~/dotfiles/tmux.conf',
      \  '~/dotfiles/zshrc'
      \ ]
let g:startify_custom_header = 'startify#pad(startify#fortune#quote())'
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
let g:startify_session_number = 5
let g:startify_session_sort = 1

" coc - conquer of code
let g:coc_global_extensions = [
\ "coc-tsserver",
\ "coc-yaml",
\ "coc-json",
\ "coc-highlight",
\ "coc-eslint",
\ "coc-prettier",
\ "coc-css",
\ "coc-emmet",
\ "coc-html",
\ "coc-actions"
\ ]

" go to navigation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<cr>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gt <Plug>(coc-type-definition)

