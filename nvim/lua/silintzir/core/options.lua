local o = vim.o

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.editorconfig = true
-- vim.g.loaded_node_provider = 1

o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

o.fixendofline = true
o.fileformat = 'unix'

-- show numbers
o.number = true

-- enable mouse
o.mouse = 'a'

-- do not show mode, status line will show mode
o.showmode = false

-- use system clipboard
o.clipboard = 'unnamedplus'

-- enable break indent
o.breakindent = true

-- save undo history
o.undofile = true
o.swapfile = false

-- no hidden buffers - unload
o.hidden = true
o.swapfile = false

-- case insensitive search unless capital letters are used
o.ignorecase = true
o.smartcase = true

-- keep sign column by default
o.signcolumn = 'yes'

-- decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
o.timeout = true
o.timeoutlen = 300

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- Preview substitutions live, as you type!
o.inccommand = 'split'

-- Show which line your cursor is on
o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10

-- set highlight on search. a keymap allow to clear highlights when escape is used in normal mode
o.hlsearch = true

-- show tabs and spaces
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', eol = '$', space = '·' }
