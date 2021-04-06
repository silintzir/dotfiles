local indent = 2
local utils = require("utils")
local opt = utils.opt
local map = utils.map

-- global options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.hlsearch = false
vim.o.mouse = "a"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = "filnxtToOFc"
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.joinspaces = false
vim.o.scrolloff = 5
vim.o.shiftround = true
vim.o.sidescrolloff = 8
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.cmdheight = 2
vim.o.updatetime = 50
vim.o.undodir = "~/.vim/undodir"
vim.o.writebackup = false -- suggested by coc.nvim
vim.o.backup = false -- sugge  by coc.nvim
vim.o.showmode = false

-- buffer-scoped options
opt("b", "expandtab", true) -- Use spaces instead of tabs
opt("b", "shiftwidth", indent) -- Size of an indent
opt("b", "smartindent", true) -- Insert indents automatically
opt("b", "tabstop", indent) -- Number of spaces tab counts for
opt("b", "formatoptions", "jql")
opt("b", "swapfile", false)

-- window-scoped options
opt("w", "number", true) -- show number column
opt("w", "relativenumber", true) -- show relative numbers in column
opt("w", "colorcolumn", "120")
opt("w", "signcolumn", "yes")
opt("w", "wrap", false)
opt("w", "scroll", 15)

-- (auto)commands
vim.cmd("command! Bd %bd")
vim.cmd("command! Bo %bd|e#|bd#")
vim.cmd("command! R w | :e")
vim.cmd("command! Remove call delete(expand('%')) | bdelete!")

-- highlight on yank
function _G.HighlightOnYank()
    vim.highlight.on_yank {higroup = "IncSearch", timeout = 250}
end
utils.exec(
    [[
  augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua HighlightOnYank()
  augroup END
]]
)

utils.exec([[
augroup THE_PRIMEAGEN
  autocmd!
  autocmd BufWritePre *.md %s/\s\+$//e
augroup END
]])

-- cursor line only on active buffer
utils.exec(
    [[
  augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup END
]]
)

-- automatically create non-existent directories on :e
utils.exec(
    [[
  augroup CreateDirectory
      autocmd!
      autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
  augroup END
]]
)

-- terminal mode start on Insert
utils.exec([[
  augroup TerminalManageMode
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
]])

-- escape with j/k
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

-- treat visual and physical lines the same when navigating
map("n", "j", "gj")
map("n", "k", "gk")

-- home / end
map("n", "H", "^")
map("o", "H", "^")
map("x", "H", "^")
map("n", "L", "g_")
map("o", "L", "g_")
map("x", "L", "g_")

-- insert mode commands editing
map("i", "<C-l>", "<Del>") -- forward delete in insert mode

-- editing files
map("n", "<Leader>ee", ":edit <C-r>=expand('%:h')<CR>/")
map("n", "<Leader>ev", ":vsplit <C-r>=expand('%:h')<CR>/")
map("n", "<Leader>es", ":split <C-r>=expand('%:h')<CR>/")

-- better deletions
map("n", "x", '"_x')
map("n", "X", '"_x')
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

-- better yanking
map("x", "y", "ygv<ESC>") -- keep the cursor at the bottom of the visual selection after yanking
map("n", "Y", "y$")
map("n", "<leader>y", '"+y') -- yank to the system clipboard (normal mode)
map("v", "<leader>y", '"+y') -- yank to the system clipboard (visual mode)

-- better putting (pasting)
map("x", "p", "pgvy") -- prevent selecting and pasting from overwriting what was originally copied
map("v", "<leader>p", '"_dp') -- visual mode paste without overwriting the default registers

-- F buttons functionality
map("n", "<F2>", ":set invrelativenumber<CR>")
map("n", "<F3>", ":set hlsearch!<CR>")
map("n", "<F5>", ":NERDTreeToggle<CR>")
map("n", "<F11>", ":source %<CR>", {silent = true, noremap = true})
map("n", "<F12>", ":luafile %<CR>")

-- Navigation in quickfix
map("n", "<C-k>", ":CocPrev<CR>")
map("n", "<C-j>", ":CocNext<CR>")
map("n", "<C-;>", ":CocListResume<CR>")

-- Misc
map("n", "<leader>qq", ":qall!<CR>")
map("n", "<leader>xx", ":bd<CR>")
map("n", "<leader>??", ':h <C-R>=expand("<cword>")<CR><CR>')
map("n", "<leader>=", ":vertical resize +10<CR>")
map("n", "<leader>-", ":vertical resize -10<CR>")
map("n", "<leader>!", ":resize 100<CR>")

-- Search / Replace / Rename
map("n", "<C-l>", ":let @/=''<CR>", {silent = true}) -- clear searches

-- Substitute commands s
map("n", "s*", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn", {silent = true, noremap = true})
map("x", "s*", '"sy:let @/=@s<CR>cgn', {silent = true, noremap = true})
map("n", "<leader>sf", ":%s///gI<Left><Left><Left>") -- search with star(*) and replace (no confirmation)
map("n", "<leader>sfc", ":%s///gIc<Left><Left><Left><Left>") -- search like before but confirm before each substitution
map("x", "<leader>sf", ":s///gI<Left><Left><Left>") -- visual mode
map("x", "<leader>sfc", ":s///gIc<Left><Left><Left><Left>") -- visual mode with confirmation

-- terminal
map("n", "<leader>;", ":vsp<CR>:terminal<CR>")
map("n", "<leader>;s", ":sp<CR>:terminal<CR>")
map("t", "<C-o>", [[<C-\><C-n>]])

require("plugins")
require("theme")
require("plugins.netrw")

-- this is the file that loads coc.nvim
vim.cmd([[source ~/.config/nvim/coc.vim]])
vim.cmd([[source ~/.config/nvim/barbar.vim]])
