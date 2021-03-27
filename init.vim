"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')


" treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/tagbar'
Plug 'bronson/vim-visual-star-search'
Plug 'haya14busa/is.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsc', 'typescript', 'typescriptreact'],
  \ 'do': 'make install'
\}
call plug#end()

"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Set commands and settings
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" set exrc
filetype plugin indent on
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
set nrformats=

"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Mappings & Keyboard shortcuts
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------

" Leader key
let mapleader = " "

" Better escape
inoremap jk <esc>
inoremap kj <esc>
inoremap <C-c> <esc>

" Treat visual and physical lines the same when navigating with the h,j,k,l physical lines the physical lines the physical lines the physical lines the physical lines the physical lines the physical lines the physical lines the physical lines the physical lines the physical lines the physical lines the physical lines the physical lines the
noremap j gj
noremap k gk
" noremap $ g$
" noremap 0 g0

" Better deleting
" protect default register from overwriting - write to the dead register instead for x and d buttons
nnoremap x "_x
nnoremap X "_x
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Better yanking
" keep cursor at the bottom of the visual selection after yanking
xnoremap y ygv<esc>
" shift y to copy from the cursor till the end of the line, same as with D and C
nnoremap Y y$
" Support yanking to the system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Better putting (pasting)
" prevent selecting and pasting from overwriting what was originally copied
xnoremap p pgvy
" GREATEST REMAP EVER !!! visual model paste without ovewriting the default registers
vnoremap <leader>p "_dP

" insert empty spaces and lines
noremap <leader><space> i <Esc>
noremap <leader>o O<Esc>

" ------------ F BUTTONS ------------
" toggle relative numbers
noremap <F2> :set invrelativenumber<cr>
" toggle highlighting of search
noremap <F3> :set hlsearch!<cr>
" toggle git gutter
noremap <F4> :GitGutterToggle<cr>
noremap <F5> :NERDTreeToggle<cr>
noremap <F6> :TagbarToggle<cr>
" edit the vimrc and reload configuration
noremap <F11> :vsp $MYVIMRC<cr>
noremap <F12> :source $MYVIMRC<cr>

" Quit vim
nnoremap <leader>qq :qall!<cr>

" Resizing
nnoremap <leader>+ :vertical resize +10<CR>
nnoremap <leader>- :vertical resize -10<CR>
nnoremap <leader>rp :resize 100<CR>

" ------------ NAVIGATION ------------
" navigate in buffers while in window with up and oown arrows
nnoremap <Up> :bn<cr>
nnoremap <Down> :bp<cr>
" navigate in windows with left and right arrow
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l
" open new tab
nnoremap <C-t> :tabnew<cr>
" navigate through tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

nnoremap <leader>mr :CocList mru<CR>

" ------------ SEARCHING/REPLACING/RENAMING ------------
" searches for the occurence of the word under cursor but not in a word match mode like with star (*)*
nnoremap <leader>bs /<C-R>=escape(expand("<cword>"), "/")<CR><CR>
" clear search highlights with double space
nmap <leader>/ :let @/=''<cr>
" Rename symbol (coc)
nmap <leader>rns <Plug>(coc-rename)
" Project wide search (find-in-project)
nmap <leader>fip :CocSearch <C-r>=expand("<cword>")<cr><cr>
" Start search and replace
" Press * to search for the term under the cursor or a visual selection and
" then press the key below to replace all instances of it in the current files
nnoremap <leader>rif :%s///gI<Left><Left><Left>
nnoremap <leader>rifc :%s///gIc<Left><Left><Left><Left>
" The same as above but instead of acting on the whole file it will
" be restricted to the previously visually selected range. You can do that
" by pressing *, visually selecting the range you want it to apply and then
" press a key below to replace all instances of it in the current selection
xnoremap <leader>rif :s///gI<Left><Left><Left>
xnoremap <leader>rifc :s///gIc<Left><Left><Left><Left>
" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" -------------------------- COC ------------------------------
" Use K to view documentation for an item in preview window
" this uses the show_documentation function defined later in this file
nnoremap <silent> K :call <SID>show_documentation()<cr>
" go to navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" diagnostix
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> <leader>diag :<C-u>CocList diagnostics<cr>
" find symbol of current document
nnoremap <silent><nowait> <leader>out :<C-u>CocList outline<cr>


" --------------------- TERMINAL --------------------------


" get help for the word under cursor
nnoremap <leader>?? :h <C-R>=expand("<cword>")<CR><CR>



nnoremap <leader>u :UndotreeShow<CR>

" open a new tab
" open netrw
" nnoremap <C-n> :Vexplore<cr>
" copen
nnoremap <leader>' :copen<cr>
" terminal
nnoremap <leader>; :vsp<cr>:terminal<cr>i
tnoremap <C-d>  <C-\><C-n>
tnoremap <Esc> <C-\><C-n>


" formatting selected code
xmap <leader>fmt <Plug>(coc-format-selected)
nmap <leader>fmt <Plug>(coc-format-selected)

" Applying codeAction to the selected region
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>act <Plug>(coc-codeaction)
" apply auto fix to problem in the current line
nmap <leader>fix <Plug>(coc-fix-current)

  " Mappings for CocList
" search for workspace symbols
nnoremap <silent><nowait> <leader>sym :<C-u>CocList -I symbols<cr>


" use tab for trigger completion with characters ahead and navigate
" NOTE: use command ':verbose imap <tab>' to make sure tab is not mapped
" by any other plugin before putting this into your config
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<tab>" :
  \ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-Space> coc#refresh()

" make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<cr>\<C-r>=coc#on_enter()\<cr>"

" telescope shortcuts
nnoremap <C-P> :lua require('mystuff.telescope').find_files()<cr>
nnoremap <leader>gg :lua require('mystuff.telescope').grep_string()<cr>
nnoremap <leader>ee :lua require('mystuff.telescope').buffers()<cr>
nnoremap <leader>fb :lua require('mystuff.telescope').file_browser()<cr>
nnoremap <leader>ll :lua require('mystuff.telescope').live_grep()<cr>
" nnoremap <leader>gg :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<cr>
nnoremap <leader>sf :NERDTreeFind<cr><c-l>
nnoremap <leader>rr :lua require('telescope.builtin').registers()<cr>
nnoremap <leader>hh :lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gb :lua require('mystuff.telescope').git_branches()<cr>
nnoremap <leader>sdf :lua require('mystuff.telescope').search_dotfiles()<cr>

"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Commands
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" add `:Format` command to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command to organize imports of the current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" set wrap, line break and do now show and invisible characters
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Unwrap set nowrap nolinebreak nolist

"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Auto commands
"----------------------------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------------------------
" Auto resize splits on vim resize
autocmd VimResized * wincmd=

" Update a buffer's contents on focus if changed outside vim
" autocmd FocusGained,BufEnter * :checktime

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
  autocmd FileType *\(^\(TelescopePrompt\|startify\|netrw\|terminal\|help\)\)\@<! :call TurnOnGuides()
  autocmd FileType TelescopePrompt,startify,netrw,help,terminal :call TurnOffGuides()
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
" augroup JsonToJsonc
"   autocmd!
"   autocmd! FileType json set filetype=jsonc
" augroup end

" coc highlight
augroup CocHighlight
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

" NERDTree
" auto show nerd tree when vim opens
autocmd VimEnter * NERDTree | wincmd p
" " prevent other buffers replacing the NERDTree
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" change local working directory upon tab creation
" function! OnTabEnter(path)
"   if isdirectory(a:path)
"     let dirname = a:path
"   else
"     let dirname = fnamemodify(a:path, ":h")
"   endif
"   execute "tcd " . dirname
" endfunction()
" autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))

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
let g:gruvbox_transparent_bg='1'
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
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutJump = '<M-n>'
let g:AutoPairsShortcutToggle = '<M-p>'
let g:AutoPairsShortcutFastWrap = '<M-e>'

" matze/vim-move
let g:move_key_modifier = 'C'

" nvim-telescope/telescope.nvim
lua require('plenary.reload').reload_module('mystuff.telescope')
lua require('mystuff')

" treesitter
lua require'nvim-treesitter.configs'.setup {
  \ highlight = { enable = true },
  \ indent = { enable = false }
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
      \   {'a': '~/Projects/dotfiles/alacritty.yml'},
      \   {'c': '~/Projects/dotfiles/init.vim'} ,
      \   {'i': '~/Projects/dotfiles/install'},
      \   {'l': '~/Projects/dotfiles/lua/mystuff/telescope.lua'},
      \   {'s': '~/Projects/dotfiles/SHORTCUTS.md'},
      \   {'t': '~/Projects/dotfiles/tmux.conf'},
      \   {'z': '~/Projects/dotfiles/zshrc'},
      \ ]
let g:startify_enable_special = 0
let g:startify_fortune_use_unicode = 1
let g:startify_skiplist = [
      \  '~/Projects/dotfiles/alacritty.yml',
      \  '~/Projects/dotfiles/init.vim' ,
      \  '~/Projects/dotfiles/install',
      \  '~/Projects/dotfiles/lua/mystuff/telescope.lua',
      \  '~/Projects/dotfiles/SHORTCUTS.md',
      \  '~/Projects/dotfiles/tmux.conf',
      \  '~/Projects/dotfiles/zshrc'
      \ ]
let g:startify_custom_header = 'startify#pad(startify#fortune#quote())'
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
let g:startify_session_number = 5
let g:startify_session_sort = 1

" NERDTree
let g:NERDTreeWinSize=50
let g:NERDTreeShowHidden=1

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
\ "coc-actions",
\ "coc-lists",
\ "coc-lua"
\ ]

" used to show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" used for completion by using tabs
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" custom commands
fun! EmptyRegisters()
  let regs = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfun

echo "Vim configuration reloaded!!!"
