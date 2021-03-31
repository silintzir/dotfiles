local map = require("utils.vim").map

-- escape button alternatives
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")
map("i", "<C-c", "<Esc>")

-- F buttons functionality
map("n", "<F2>", "<CMD>set invrelativenumber<CR>")
map("n", "<F3>", "<CMD>set hlsearch!<CR>")
map("n", "<F5>", "<CMD>NERDTreeToggle<CR>")
map("n", "<F12>", "<CMD>luafile %<CR>")

map("n", "<C-p>", "<CMD>lua require('utils.telescope').find_files()<CR>")
map("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
