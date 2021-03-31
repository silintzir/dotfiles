local indent = 2
local opt = require("utils.vim").opt

-- global options
opt("o", "hlsearch", false) -- do not highlight searches
opt("o", "mouse", "a") -- enable mouse in terminal
opt("o", "completeopt", "menuone,noinsert,noselect")
opt("o", "shortmess", "filnxtToOFc")
opt("o", "hidden", true) -- Enable modified buffers in background
opt("o", "smartcase", true) -- Ignore case only if search is done with small letters
opt("o", "joinspaces", false) -- Only one space after join command with '.', '?', '!'
opt("o", "scrolloff", 4) -- Minimal number of screen lines to keep above and below the cursor.
opt("o", "shiftround", true) -- Round indent to multiple of 'shiftwidth'. CTRL-T and CTRL-D to indent in insernt mode
opt("o", "sidescrolloff", 8) -- The minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set.
opt("o", "splitbelow", true) -- Put new windows below current
opt("o", "splitright", true) -- Put new windows right of the current
opt("o", "termguicolors", true) -- true color support
opt("o", "cmdheight", 2) -- command lines to show
opt("o", "updatetime", 50)
opt("o", "undodir", "~/.vim/undodir")

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
