local set = vim.keymap.set
local common = { noremap = true, silent = true }

-- escape with kj
set('i', 'kj', '<esc>')

-- save with c-s
set({ 'n', 'i' }, '<C-s>', '<esc>:w!<cr>', common)

-- close buffer
set('n', '<leader>x', '<cmd>BufDel<cr>', { desc = 'Buffer close' })

-- clear highlight from search on escape when in normal mode
set('n', '<esc>', ':nohlsearch<cr>')

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
--
-- See `:help wincmd` for a list of all window commands
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
set('n', '<Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

set('n', '<C-j>', ':m .+1<CR>==')
set('n', '<C-k>', ':m .-2<CR>==')
set('v', '<C-j>', ":m '>+1<CR>gv-gv")
set('v', '<C-k>', ":m '<-2<CR>gv-gv")

-- Quickfix
set('n', '<C-q>', ':call QuickFixToggle()<cr>', { desc = 'Quickfix toggle', silent = true })
set('n', ']q', ':cnext<cr>', { desc = 'Quickfix: next', silent = true })
set('n', '[q', ':cprev<cr>', { desc = 'Quickfix: prev', silent = true })

set('n', '<C-w>', ':lua ToggleLocationList()<cr>', { desc = 'Location list toggle', silent = true })
set('n', ']w', ':lnext<cr>', { desc = 'Location: next', silent = true })
set('n', '[w', ':lprev<cr>', { desc = 'Location: prev', silent = true })

-- better navigation when wrap is on
set('n', 'j', 'gj', common)
set('n', 'k', 'gk', common)
set('n', '$', 'g$', common)
set('n', '0', 'g0', common)

-- better yanking
set('n', 'Y', 'y$', common)
set('v', 'y', 'ygv<ESC>', common)

-- better putting
set('v', 'p', 'pgvy', common)

-- better indenting
set('v', '<', '<gv', common)
set('v', '>', '>gv', common)

-- replace/rename
set('n', 'r*', ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn", { desc = '[R]eplace word under cursor' })
set('v', 'r*', '"sy:let @/=@s<CR>cgn', { desc = '[R]eplace selection' })

-- leap.nvim
set('n', 's', '<Plug>(leap)')
set('n', 'S', '<Plug>(leap-from-window)')
set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')

set('n', '<leader>tc', '<cmd>ColorizerToggle<cr>', { desc = '[T]oggle [C]olorizer' })
set('n', '<leader>tr', '<cmd>lua ToggleRelativeNumbers()<cr>', { desc = '[T]oggle [R]elative numbers' })
set('n', '<leader>tw', '<cmd>lua ToggleWrap()<cr>', { desc = '[T]oggle [W]rap' })
