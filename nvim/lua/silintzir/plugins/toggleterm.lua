return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup()

    local set = vim.keymap.set
    set('n', '<C-\\>', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Open terminal' })
    set('t', '<C-\\>', '<cmd>ToggleTermToggleAll<CR>', { desc = 'Close terminal' })
    set('t', '<C-x>', '<C-\\><C-N>', { desc = 'Terminal escape' })
  end,
}
