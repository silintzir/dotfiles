local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- 1. Simple plugin (just the github repo)
	"tpope/vim-surround",
	{
		url = "https://codeberg.org/andyg/leap.nvim",
		lazy = false,
	},
})

local set = vim.keymap.set
local common = { noremap = true, silent = true }

vim.g.mapleader = " " -- Sets leader to Space
vim.g.maplocalleader = " " -- Sets local leader to Space

-- close buffer
set("n", "<leader>x", [[<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>]])

-- move lines
set("n", "<C-j>", ":m .+1<CR>==")
set("n", "<C-k>", ":m .-2<CR>==")
set("v", "<C-j>", ":m '>+1<CR>gv-gv")
set("v", "<C-k>", ":m '<-2<CR>gv-gv")

-- better navigation when wrap is on
set("n", "j", "gj", common)
set("n", "k", "gk", common)
set("n", "$", "g$", common)
set("n", "0", "g0", common)
set("v", "j", "gj", common)
set("v", "k", "gk", common)
set("v", "$", "g$", common)
set("v", "0", "g0", common)

-- better yanking
set("n", "Y", "y$", common)
set("v", "y", "ygv<ESC>", common)

-- better putting
set("v", "p", "pgvy", common)

-- better indenting
set("v", "<", "<gv", common)
set("v", ">", ">gv", common)

-- replace/rename
set("n", "<leader>*", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn", { desc = "[R]eplace word under cursor" })
set("v", "<leader>*", '"sy:let @/=@s<CR>cgn', { desc = "[R]eplace selection" })

-- leap.nvim
set("n", "s", "<Plug>(leap)")
set("n", "S", "<Plug>(leap-from-window)")
set({ "x", "o" }, "s", "<Plug>(leap-forward)")
set({ "x", "o" }, "S", "<Plug>(leap-backward)")
